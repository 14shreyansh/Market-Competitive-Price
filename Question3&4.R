dataset2<-read.csv('CustomerOrderItemDetails.csv')
dataset2<-dataset2[-1]
dataset2<-dataset2[-1]
dataset2<-dataset2[-1]

dataset2_aggr<-aggregate(Quantity~ Dish.Name, dataset2, FUN = function(x) sum(as.numeric(as.character(x))))
dataset2_aggr <- dataset2_aggr[order(-dataset2_aggr$Quantity),]

summary(dataset2_aggr)

dishes_remove<-dataset2_aggr[which(dataset2_aggr[,2]<30),]

dishes_promote<-subset(dataset2_aggr,Quantity>30)
dishes_promote<-subset(dishes_promote,Quantity<153)

#goli_promote shows the dishes that should be promoted to increase their sell.
#goli_remove shows dishes that should be removed from the menu list.
#for promotion we have choosed those dishes whose sell lies between median sale and mean sale.
#for remove, we have choosed those dishes whose sell are less than median sale.
