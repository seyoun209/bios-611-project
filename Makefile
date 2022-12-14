.PHONY: clean
SHELL: /bin/bash

all:01.source/cleanup_data.csv\
	03.figure/preliminary_fig.png\
	03.figure/cupofcoffee.png\
	03.figure/codingwithoutcoffee.png\
	03.figure/threecorr.png\
	03.figure/solve_bugs.png\
	03.figure/pca_gender.png\
	03.figure/pca_coffeetime.png\
	report.html

report.html:report.Rmd\
	03.figure/preliminary_fig.png\
	03.figure/cupofcoffee.png\
	03.figure/codingwithoutcoffee.png\
	03.figure/threecorr.png\
	03.figure/solve_bugs.png\
	03.figure/pca_gender.png\
	03.figure/pca_coffeetime.png
	Rscript -e "rmarkdown::render('report.Rmd', output_format = 'html_document')"

clean:
	rm -rf 03.figure
	rm report.html
	rm 01.source/cleanup_data.csv

01.source/cleanup_data.csv:01.source/coffeeandcode2018.csv
	mkdir -p 02.code
	Rscript 02.code/data_cleanup.R
	
03.figure/preliminary_fig.png:01.source/coffeeandcode2018.csv
	mkdir -p 03.figure
	Rscript 02.code/project_skeleton_review.R

03.figure/cupofcoffee.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R

03.figure/codingwithoutcoffee.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R
	
03.figure/solve_bugs.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R

03.figure/threecorr.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R
	
03.figure/pca_gender.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R

03.figure/pca_coffeetime.png:01.source/cleanup_data.csv
	mkdir -p 03.figure
	Rscript 02.code/results_plots.R
  
shiny_app: 01.source/cleanup_data.csv shinyapp.R
	Rscript shinyapp.R ${PORT}