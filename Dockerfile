FROM rocker/verse
MAINTAINER Jessbyun <sbyun@unc.edu>
RUN R -e "install.packages(c('rvest', 'tidyverse', 'shiny', 'plotly', 'ggplot2', 'GGally','remotes','data.table','ggpubr'))"
RUN Rscript --no-restore --no-save -e "update.packages(ask = FALSE);"

