.PHONY: clean
SHELL: /bin/bash

#all:sour

#report.pdf: 

clean:
  rm -f plilimanary_figure.png

03.figures/winner_number_starbakers.png: \
  winner_figures.R\
  derived_data/winning_data.csv
  mkdir -p figures
  Rscript winner_figures.R
  
shiny_app: source_data/baker_results.csv shinyapp.R
	Rscript shinyapp.R ${PORT}