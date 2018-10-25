dataset8<-read.csv('CustomerOrderItemDetails.csv')
dataset8<-dataset8[-1]
dataset8<-dataset8[-1]
dataset8<-dataset8[-1]
dataset8_aggr<-aggregate(Quantity~ Dish.Name, dataset8, FUN = function(x) sum(as.numeric(as.character(x))))
dataset8_aggr <- dataset8_aggr[order(-dataset8_aggr$Quantity),]
colnames(dataset8_aggr)[1] <- "Menu.Item"


dataset9<- read.csv('MarketPricing.csv')

dataset9_goli <- subset(dataset9,Restaurant=='Goli',select=c("Restaurant","Menu.Item","Rate","Menu.Header"))
dataset9_goli<-dataset9_goli[-1]

dataset8_merge<-as.data.frame(merge(dataset8_aggr,dataset9_goli,by=c("Menu.Item")))
dataset8_merge <- dataset8_merge[order(dataset8_merge$Quantity,decreasing = TRUE),]


library(dplyr)
Bread <- filter(dataset8_merge, Menu.Header=="Breads")
Maincourse<-filter(dataset8_merge, Menu.Header=="Main Course")
starters<-filter(dataset8_merge, Menu.Header=="Starters")
friedrice<-filter(dataset8_merge, Menu.Header=="Fried Rice and Noodles" )
rice<-filter(dataset8_merge, Menu.Header=="Rice" )
Rolls<-filter(dataset8_merge, Menu.Header=="Rolls" )
platters<-filter(dataset8_merge, Menu.Header=="Platters" )
chinesedishes<-filter(dataset8_merge, Menu.Header=="Chinese Dishes" )
salad<-filter(dataset8_merge, Menu.Header=="Accompaniments")

salad<-salad[1:2,]
rice<-rice[1:2,]
starters<-starters[1:2,]
friedrice<-friedrice[1:2,]
Maincourse<-Maincourse[1:2,]
Bread<-Bread[1:2,]
chinesedishes<-chinesedishes[1:2,]

salad<-salad[,-2]
rice<-rice[,-2]
starters<-starters[,-2]
friedrice<-friedrice[,-2]
Maincourse<-Maincourse[,-2]
Bread<-Bread[,-2]
chinesedishes<-chinesedishes[,-2]
platters<-platters[,-2]
Rolls<-Rolls[,-2]

combo1<-as.data.frame(list(Bread[1,1:3],Maincourse[1,1:3],starters[1,1:3],salad[1,1:3],salad[2,1:3]))
combo1$combo.Rate<-400

combo2<-as.data.frame(list(Bread[2,1:3],Maincourse[2,1:3],starters[2,1:3]))  
combo2$combo.Rate<-250

combo3<-as.data.frame(list(chinesedishes[1,1:3],friedrice[2,1:3]))
combo3$combo.Rate<-205

combo4<-as.data.frame(list(chinesedishes[2,1:3],friedrice[1,1:3]))
combo4$combo.Rate<-300

combo5<-as.data.frame(list(platters[2,1:3],Rolls[1,1:3]))
combo5$combo.Rate<-720

combo6<-as.data.frame(list(rice[2,1:3],Rolls[2,1:3]))
combo6$combo.Rate<-170

#combo 1-6 are the combos we have formed as per the quantities of dishes sold in the market and their header.
#As per a small survey in the market we have seen a usual 10% discount in the combo price from the mrp so here also we have choosen 10% less price for all the combos.