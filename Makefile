REV=$(shell git show -s --format=%ci HEAD)
MAIN=cheatsheet

all: $(MAIN).pdf

revision.tex: $(MAIN).tex
	echo -n "\\\\newcommand\\\\revision{$(REV)}" > $@

$(MAIN).pdf: $(MAIN).tex revision.tex
	pdflatex $(MAIN).tex

clean:
	rm -f *.aux *.log *.pdf revision.tex
