/
// readwav.c - Read samples from a WAV file using FFmpeg via a pipe
// Written by Ted Burke - last updated 10-2-2017
//
// To compile:
//
//    gcc readwav.c -o readwav -lm
//
 
#include <stdio.h>
#include <stdint.h>
 
#define N 882
 
void main()
{
    // Create a 20 ms audio buffer (assuming Fs = 44.1 kHz)
    int16_t buf[N] = {0}; // buffer
    int n;                // buffer index
     
    // Open WAV file with FFmpeg and read raw samples via the pipe.
    FILE *pipein;
    pipein = popen("ffmpeg -i whistle.wav -f s16le -ac 1 -", "r");
    fread(buf, 2, N, pipein);
    pclose(pipein);

    

    
    // Print the sample values in the buffer to a CSV file
    FILE *csvfile;
    csvfile = fopen("samples.csv", "w");
    for (n=0 ; n<N ; ++n) fprintf(csvfile, "%d\n", buf[n]);
    fclose(csvfile);
}
