#include <stdio.h>
#include <stdint.h>
 
//////////////////////////////////////////////////////////////
//  Filter Code Definitions
//////////////////////////////////////////////////////////////
 
// maximum number of inputs that can be handled
// in one function call
#define MAX_INPUT_LEN   80
// maximum length of filter than can be handled
#define MAX_FLT_LEN     63
// buffer to hold all of the input samples
#define BUFFER_LEN      (MAX_FLT_LEN - 1 + MAX_INPUT_LEN)
 
// array to hold input samples
int16_t insamp[ BUFFER_LEN ];
 
// FIR init
void firFixedInit( void )
{
    memset( insamp, 0, sizeof( insamp ) );
}
 
// store new input samples
int16_t *firStoreNewSamples( int16_t *inp, int length )
{
    // put the new samples at the high end of the buffer
    memcpy( &insamp[MAX_FLT_LEN - 1], inp,
            length * sizeof(int16_t) );
    // return the location at which to apply the filtering
    return &insamp[MAX_FLT_LEN - 1];
}
 
// move processed samples
void firMoveProcSamples( int length )
{
    // shift input samples back in time for next time
    memmove( &insamp[0], &insamp[length],
            (MAX_FLT_LEN - 1) * sizeof(int16_t) );
}
 
// the FIR filter function
void firFixed( int16_t *coeffs, int16_t *input, int16_t *output,
       int length, int filterLength )
{
    int32_t acc;     // accumulator for MACs
    int16_t *coeffp; // pointer to coefficients
    int16_t *inputp; // pointer to input samples
    int n;
    int k;
 
    // apply the filter to each input sample
    for ( n = 0; n < length; n++ ) {
        // calculate output n
        coeffp = coeffs;
        inputp = &input[n];
        // load rounding constant
        acc = 1 << 14;
        // perform the multiply-accumulate
        for ( k = 0; k < filterLength; k++ ) {
            acc += (int32_t)(*coeffp++) * (int32_t)(*inputp--);
        }
        // saturate the result
        if ( acc > 0x3fffffff ) {
            acc = 0x3fffffff;
        } else if ( acc < -0x40000000 ) {
            acc = -0x40000000;
        }
        // convert from Q30 to Q15
        output[n] = (int16_t)(acc >> 15);
    }
}
 
//////////////////////////////////////////////////////////////
//  Test program
//////////////////////////////////////////////////////////////
 
// bandpass filter centred around 1000 Hz
// sampling rate = 8000 Hz
// gain at 1000 Hz is about 1.13
 
#define FILTER_LEN  63
int16_t coeffs[ FILTER_LEN ] =
{
 -1468, 1058,   594,   287,    186,  284,   485,   613,
   495,   90,  -435,  -762,   -615,   21,   821,  1269,
   982,    9, -1132, -1721,  -1296,    1,  1445,  2136,
  1570,    0, -1666, -2413,  -1735,   -2,  1770,  2512,
  1770,   -2, -1735, -2413,  -1666,    0,  1570,  2136,
  1445,    1, -1296, -1721,  -1132,    9,   982,  1269,
   821,   21,  -615,  -762,   -435,   90,   495,   613,
   485,  284,   186,   287,    594, 1058, -1468
};
 
// Moving average (lowpass) filter of length 8
// There is a null in the spectrum at 1000 Hz
 
#define FILTER_LEN_MA   8
int16_t coeffsMa[ FILTER_LEN_MA ] =
{
    32768/8, 32768/8, 32768/8, 32768/8,
    32768/8, 32768/8, 32768/8, 32768/8
};
 
// number of samples to read per loop
#define SAMPLES   128
 
int main( void )
{
    int size;
    int16_t input[SAMPLES];
    int16_t output[SAMPLES];
    int16_t *inp;
    FILE   *in_fid;
    FILE   *out_fid;
    FILE   *out_fid2;
 

     // Open WAV file with FFmpeg and read raw samples via the pipe.   
    in_fid = popen("ffmpeg -i sail_away.wav -f s16le -ac 1 -", "r");
    if ( in_fid == 0 ) {
        printf("couldn't open sail_away.wav");
        return;
    }
    
    // Pipe the audio data to ffmpeg, which writes it to a wav file
    out_fid = popen("ffmpeg -y -f s16le -ar 96000 -ac 1 -i - beep.wav", "w");
    if ( out_fid == 0 ) {
        printf("couldn't output to pipe beep.wav");
        return;
    }
    out_fid2 = fopen( "outputFixedMa.raw", "wb" );
    if ( out_fid == 0 ) {
        printf("couldn't open outputFixedMa.raw");
        return;
    }
 
    // initialize the filter
    firFixedInit();
 
    // process all of the samples
    do {
        // read samples from file
        size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
        // store new samples in working array
        inp = firStoreNewSamples( input, size );
	printf("Calcule %d samples\n",size);
        // apply each filter
        firFixed( coeffsMa, inp, output, size, FILTER_LEN );
        fwrite( output, sizeof(int16_t), size, out_fid );
 
        firFixed( coeffsMa, inp, output, size, FILTER_LEN_MA );
        fwrite( output, sizeof(int16_t), size, out_fid2 );

	
        // move processed samples
        firMoveProcSamples( size );
    } while ( size != 0 );
 
    pclose( in_fid );
    pclose( out_fid );
    fclose( out_fid2 );
 
    return 0;
}

