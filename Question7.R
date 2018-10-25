dataset4<-read.csv('MarketPricing.csv')
dataset4 <- as.data.frame(unique( dataset4[,5]))

library(stringr)
foo<-as.data.frame(str_split_fixed(dataset4$`unique(dataset4[, 5])`, ",", 7))

occurences<-table(unlist(foo))

loved_dishes<-as.data.frame(occurences)
loved_dishes<-aggregate(Freq~Var1,data=loved_dishes,FUN=sum)
loved_dishes <- loved_dishes[order(-loved_dishes$Freq),]
loved_dishes<-loved_dishes[-1,]

#most loved dishes- Butter Chicken, Chicken Biryani