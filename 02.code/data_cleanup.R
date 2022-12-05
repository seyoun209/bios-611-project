library(tidyverse)
library(ggplot2)
library(data.table)
library(ggpubr)

cc <- as.data.frame(read.csv("./01.source/coffeeandcode2018.csv",sep=",",header=T))

# Data cleaning

#codingwithoutcoffe "sometime" answers to "No"
cc[which(cc$CodingWithoutCoffee == "Sometimes"),"CodingWithoutCoffee"] <- c("No")

#coffeesolvebugs "sometime" answers to "Yes"
cc[which(cc$CoffeeSolveBugs == "Sometimes"),"CoffeeSolveBugs"] <- c("Yes")

new_cc <- cc
write.table(new_cc,"./01.source/cleanup_data.csv")
