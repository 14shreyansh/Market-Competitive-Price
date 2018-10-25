dataset3<- read.csv('CustomerBillDetail.csv')
dataset3<-dataset3[,c("Total.Bill","Customer.ID")]
dataset3 <- dataset3[order(dataset3$Total.Bill),]

segment1<-sum(dataset3$Total.Bill<150)
segment2<-sum(dataset3$Total.Bill<201&dataset3$Total.Bill>150)
segment3<-sum(dataset3$Total.Bill<264&dataset3$Total.Bill>201)
segment4<-sum(dataset3$Total.Bill<307&dataset3$Total.Bill>264)
segment5<-sum(dataset3$Total.Bill<1000&dataset3$Total.Bill>307)
segment6<-sum(dataset3$Total.Bill<6338&dataset3$Total.Bill>1000)

customersegment <- data.frame("Customer_Segment" = 1:6, "Range_of_Price"=c("0-150","150-201","201-264","264-307","307-1000","1000-6338"),"NumberofCustomer" = c(segment1,segment2,segment3,segment4,segment5,segment6))

#install.packages('ggplot2')
library(ggplot2)
p <-ggplot(customersegment, aes(Range_of_Price, NumberofCustomer))
p +geom_bar(stat = "identity")

#We have shown number of customers that lie between certain ranges, which can help Mr. Goli to see which category have more number of customers.