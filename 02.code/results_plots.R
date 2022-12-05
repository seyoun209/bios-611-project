library(ggplot2)
library(GGally)
library(data.table)

new_coffee <- as.data.frame(read.csv("01.source/cleanup_data.csv",sep=" ",header=T))

hours_vs_bugs <- data.frame(new_coffee$CodingHours,ifelse(new_coffee$CoffeeSolveBugs=="Yes",1,0))
corr1 <-ggpairs(hours_vs_bugs, columnLabels = gsub("Yes10","",gsub(".",'',gsub("ifelse","",gsub("new_coffee","",colnames(hours_vs_bugs),fixed=T)),fixed=T)), labeller = label_wrap_gen(10))

ggsave("03.figure/solve_bugs.png",plot=corr1)


hours_vs_coffee <- data.frame(new_coffee$CodingHours,new_coffee$CoffeeCupsPerDay)
corr2 <-ggpairs(hours_vs_coffee,columnLabels = gsub("Yes10","",gsub(".",'',gsub("ifelse","",gsub("new_coffee","",colnames(hours_vs_coffee),fixe=T)),fixed=T)), labeller = label_wrap_gen(10))

ggsave("03.figure/cupofcoffee.png",plot=corr2)

hours_vs_codingwithoutocffee <- data.frame(new_coffee$CodingHours,ifelse(new_coffee$CodingWithoutCoffee=="Yes",1,0))
corr3 <-ggpairs(hours_vs_codingwithoutocffee, columnLabels = gsub("Yes10","",gsub(".",'',gsub("ifelse","",gsub("new_coffee","",colnames(hours_vs_codingwithoutocffee),fixe=T)),fixed=T)), labeller = label_wrap_gen(10))

ggsave("03.figure/codingwithoutcoffee.png",plot=corr3)

solvebug_cupc_codingwocoffee <- data.frame(ifelse(new_coffee$CoffeeSolveBugs=="Yes",1,0),ifelse(new_coffee$CodingWithoutCoffee=="Yes",1,0), new_coffee$CoffeeCupsPerDay)
corr4 <-ggpairs(solvebug_cupc_codingwocoffee, columnLabels = gsub("Yes10","",gsub(".",'',gsub("ifelse","",gsub("new_coffee","",colnames(solvebug_cupc_codingwocoffee),fixe=T)),fixed=T)), labeller = label_wrap_gen(10))
ggsave("03.figure/threecorr.png",plot=corr4)


pc <- prcomp(hours_vs_coffee)
dat=data.frame(pc$x[,1:2],Coffetime=new_cc$CoffeeTime)
pc_plot <-ggplot(dat,aes(x=PC1,y=PC2,col=Coffetime))+geom_point()
ggsave("03.figure/pca_coffeetime.png",pc_plot)

pc <- prcomp(hours_vs_coffee)
dat=data.frame(pc$x[,1:2],Gender=new_cc$Gender)
pc_plot <-ggplot(dat,aes(x=PC1,y=PC2,col=Gender))+geom_point()
ggsave("03.figure/pca_gender.png",pc_plot)

