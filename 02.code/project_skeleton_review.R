library(tidyverse)
library(ggplot2)
library(data.table)
library(ggpubr)

cc <- read.csv("./01.source/coffeeandcode2018.csv",sep=",",header=T) |>  as.data.frame()

#densityplot(codinghours)
den_hr <- ggplot(cc,aes(x=CodingHours)) +geom_density()

#coffeecupsperday
coffeecupsperday <- table(cc$CoffeeCupsPerDay) |> as.data.table()
ccperday <- ggdotplot(coffeecupsperday ,x="N",y="V1",xlab="Cups of coffee day",ylab="number of person",title = "Cups of Coffee per day") 

#coding without coffee
codewocoffee <- ggplot(cc, aes(x=CodingWithoutCoffee)) +geom_bar()+theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#coffeetype
c_type <- ggplot(cc, aes(x=CoffeeType)) +geom_bar()+theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#solve bugs
bugfix <- ggplot(cc, aes(x=CoffeeSolveBugs)) +geom_bar()+theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#age range
age_range <- ggplot(cc, aes(x=AgeRange)) +geom_bar()+theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ggarrange(den_hr,ccperday,codewocoffee,c_type,bugfix,age_range,labels = c("A", "B", "C","D","E","F"),ncol = 2, nrow = 3)
