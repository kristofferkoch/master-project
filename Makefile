
all: top.pdf TODO

TODO: *.tex
	grep -in xxx *.tex  >TODO

top.pdf: *.tex boker.bib tangtool.pdf handbuffer.pdf c.pdf handshake.pdf \
	bundled.pdf compdet.pdf aesctrl.pdf teaklib.pdf fork.pdf drgate.pdf \
	balsaflow.pdf flow.pdf scanint.pdf
	rm -f *.nls *.nlo *.ist
	pdflatex top
	bibtex top
	makeindex top.nlo -s nomencl.ist -o top.nls
	pdflatex top
	pdflatex top


.SUFFIXES: .svg .pdf
.svg.pdf:
	inkscape -A $@ -z -f $< -D
#.pdf.svg:
#	inkscape -A $@ -z -f $< -D

figureclean:
	rm *.pdf
clean:
	rm -f top.pdf *.log *~ *.out *.aux *.tox *.blg *.bbl *.toc *.???.bak *.nls *.nlo *.ist *.lof *.gls *.ind *.ilg
