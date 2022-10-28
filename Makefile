.PHONY: clean
SHELL: /bin/bash

#all:sour

report.html:report.Rmd\
	03.figure/preliminary_fig.png
	Rscript -e "rmarkdown::render('report.Rmd', output_format = 'html_document')"

clean:
	rm -rf 03.figure
	rm report.log
	rm report.tex
	rm report.html

03.figure/preliminary_fig.png:01.source/coffeeandcode2018.csv
	mkdir -p 03.figure
	Rscript 02.code/project_skeleton_review.R


  
#shiny_app: source_data/baker_results.csv shinyapp.R
#	Rscript shinyapp.R ${PORT}