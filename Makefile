
all: top.pdf TODO

TODO: *.tex
	grep -in xxx *.tex  >TODO

top.pdf: *.tex boker.bib tangtool.pdf handbuffer.pdf c.pdf handshake.pdf \
	bundled.pdf compdet.pdf aesctrl.pdf teaklib.pdf
	pdflatex top
	bibtex top
	pdflatex top
	pdflatex top


.SUFFIXES: .svg .pdf
.svg.pdf:
	inkscape -A $@ -z -f $< -D
#.pdf.svg:
#	inkscape -A $@ -z -f $< -D

clean:
	rm -f *.pdf *.log *~ *.out *.aux *.tox *.blg *.bbl *.toc *.???.bak
