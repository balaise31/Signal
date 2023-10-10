    if octave --version | grep -q "6\." ; then
	echo "Octave version 6 détecté"
    elif  octave --version | grep -q "4\." ; then
	echo "Octave version 4 détecté -> setenv de OCTAVE_EXECUTABLE et CLI"
	export OCTAVE_EXECUTABLE=octave-cli
	export OCTAVE_CLI_OPTIONS="--eval \"graphics_toolkit('gnuplot')\" --persist"

    else
	echo -e "$MERDE Pas d'installation d'octave détectée..."
	echo "On tente quand même mais songez à faire une install :"
	echo "sudo apt install octave"
    fi


