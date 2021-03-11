
all: 

epub:
	latexml --dest=main.xml main.tex
	latexmlpost -dest=main.html main.xml
	ebook-convert main.html main.epub --language fr --no-default-epub-cover

clean:
	rm -rf *.aux *.toc *.xref *.prv _region_.tex *.xml *.tmp *.fdb_latexmk
	rm -f *.log
	rm -f *.pdf *.ps
	rm -f *.png
	rm -f *.dvi
	rm -f *.svg
	rm -f *.html
	rm -f *.idv *.idx *.ilg *.ind
	rm -f *.opf *.4tc *.css *.bcf *.epub *.lg *.ncx  
	rm -f *~

