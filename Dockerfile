FROM rocker/verse
MAINTAINER Jessbyun <sbyun@unc.edu>
RUN R -e "install.packages(c('rvest', 'tidyverse', 'shiny', 'plotly', 'ggplot2', 'remotes'))"

