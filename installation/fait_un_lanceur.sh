#!/bin/bash

get_abs_filename() {
  # $1 : relative filename
  filename=$1
  parentdir=$(dirname "${filename}")

  if [ -d "${filename}" ]; then
      echo "$(cd "${filename}" && pwd)"
  elif [ -d "${parentdir}" ]; then
    echo "$(cd "${parentdir}" && pwd)/$(basename "${filename}")"
  fi
}


if (( $#<1 | $#>2 )) ; then
    echo "usage $0 script_executable  [ fichier icone ]"
    exit
fi

if [[ -x $1  ]] ; then
    SCRIPT=$1
else
    echo "Le fichier $1 n'est pas executable ou n'existe pas"
    exit
fi

if  (( $#==2 )); then
    if [[ -f $2  ]] ; then
	ICONE=$2
    else
	echo "$2 n'est pas un fichier qui pourrait être une icone"
	exit
    fi
else
    ICONE=a.0
fi

SCRIPT_FULL=$(get_abs_filename $SCRIPT)
ICONE_FULL=$(get_abs_filename $ICONE)

cp lanceur.desktop.patron $SCRIPT.desktop
sed -i "s#SCRIPT_FULL#$SCRIPT_FULL#g" $SCRIPT.desktop
sed -i "s/SCRIPT/$SCRIPT/g" $SCRIPT.desktop
sed -i "s#ICONE#$ICONE_FULL#g" $SCRIPT.desktop

cat $SCRIPT.desktop
chmod a+x $SCRIPT.desktop
