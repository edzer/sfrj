all:
	vi pebesma.Rnw
	R CMD Sweave pebesma.Rnw
	pdflatex  RJwrapper.tex
	bibtex RJwrapper
	pdflatex  RJwrapper.tex
	evince RJwrapper.pdf

clean:
	rm RJwrapper.out RJwrapper.b* RJwrapper.aux RJwrapper.log 

