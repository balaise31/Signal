if [ ! -d _pdfs ];
then
    mkdir _pdfs
fi

if [ ! -d _gros_pdfs ];
then
    mkdir _gros_pdfs
fi

cd _build_d
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=../_gros_pdfs/$1_merged.pdf *.pdf 