dataset2<-read.csv('CustomerOrderItemDetails.csv')
dataset2<-dataset2[-1]
dataset2<-dataset2[-1]
dataset2<-dataset2[-1]

dataset2_aggr<-aggregate(Quantity~ Dish.Name, dataset2, FUN = function(x) sum(as.numeric(as.character(x))))
dataset2_aggr <- dataset2_aggr[order(-dataset2_aggr$Quantity),]
dishes_revenue<-subset(dataset2_aggr,Quantity>153)

#Mr. Goli should increase the price of the dishes given in dishes_revenue as these are the dishes which are sold more then others and these will increase the revenue.

