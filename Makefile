.PHONY: all clean

all: presentation.pdf

pdflatex=while (pdflatex $1; grep -q \"$2\" $1.log) do true; done

PIMGS = $(wildcard *.png)

presentation.toc: presentation.tex $(PIMGS)
	$(call pdflatex,presentation,"No file")

presentation.pdf: presentation.toc presentation.tex $(PIMGS)
	$(call pdflatex,presentation,"No file")

clean:
	rm -f presentation.aux presentation.log presentation.pdf presentation.vrb \
		presentation.toc presentation.out presentation.snm presentation.nav
