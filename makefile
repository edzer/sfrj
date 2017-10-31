all:
	vi RJtemplate.tex
	Rscript -e 'tools::texi2pdf("RJwrapper.tex")'
