dataset<- read.csv('MarketPricing.csv')

dataset<-dataset[-2]
dataset<-dataset[-4]

dataset_goli <- subset(dataset,Restaurant=='Goli',select=c("Restaurant","Menu.Item","Rate"))

dataset<-subset(dataset, Menu.Item %in% dataset_goli$Menu.Item)

dataset_goli <- unique( dataset_goli[,])

dataset <- unique( dataset[,])


library(base)
dataset_merge<-as.data.frame(merge(dataset,dataset_goli,by=c("Menu.Item")))
dataset_merge=dataset_merge[-4]
dataset_merge=dataset_merge[-4]

dataset_merge<-subset(dataset_merge, Menu.Item %in% dataset_goli$Menu.Item)

goli_rate<-aggregate(Rate.x~ Menu.Item, dataset_merge, FUN = function(x) mean(as.numeric(as.character(x))))

goli_competitiveprice<-as.data.frame(merge(dataset_goli,goli_rate,by=c("Menu.Item")))

colnames(goli_competitiveprice)[3] <- "original_Rate"
colnames(goli_competitiveprice)[4] <- "Competitive_Rate"

goli_competitiveprice$Competitive_Rate<-round(goli_competitiveprice$Competitive_Rate)

#goli_competitiveprice shows the price of the dishes that Mr. goli should keep to match up with the market price.
