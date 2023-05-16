tikz  = $(wildcard *.tikz)
pngs = $(tikz:%.tikz=%.png)

all: $(pngs) $(tex)

%.png: %.tex
	pdflatex -shell-escape $<

%tex: %tikz
	./tikz_to_tex $<

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.pdf
	rm -f *.png
	rm -f *.dvi
	rm -f *.tex
	rm -f *.ps
	rm -f \#*\#	
	rm -f *~
	cp ./tikz-dsp/* .
