setwd("E:/r_test/6_data_distrubution")

library("ggplot2")

#***************************************1绘制直方图**************
##****** 1.1简单直方图
ggplot(faithful,aes(x=waiting))+geom_histogram()

##*******1.2分组直方图
#binsize <- diff(range(faithful$waiting))/15
#p <-ggplot(faithful,aes(x=waiting)) 
#p + geom_histogram(binwidth=binsize,fill="white",colour='red')
#p + geom_histogram(binwidth=binsize,fill="white",colour='red',origin=31)

## *******1.3多组数据直方图
#*********way1 分面绘图
#library(MASS)
#p <- ggplot(birthwt,aes(x=bwt))
#p + geom_histogram(fill='white',colour='black') + facet_grid(smoke ~ .)   # 仅有一个变量，推荐用facet_wrap()

## **修改分面标签
#birthwt1 <- birthwt
#birthwt1$smoke <- factor(birthwt1$smoke)   # 必须转换为因子，才能用revalue
#library(plyr)  # 使用revalue
#birthwt1$smoke <- revalue(birthwt1$smoke,c("0"='No Smoke','1'='Smoke'))
#ggplot(birthwt1,aes(x=bwt)) + geom_histogram(fill="white",colour='black')+facet_grid(smoke ~ .)

## **修改坐标轴刻度
#ggplot(birthwt,aes(x=bwt))+geom_histogram(fill='white',colour='black') +
#facet_grid(race ~ .)
#facet_grid(race ~ .,scales='free')
#ggsave("group_histogram.png")


## ***********way2 变量赋值给fill
birthwt1 <- birthwt
birthwt1$smoke <- factor(birthwt1$smoke)
p <- ggplot(birthwt1,aes(x=bwt,fill=smoke))
p + geom_histogram(position="identity",alpha=0.4)
#p + geom_histogram(alpha=0.4)














ggsave("group_histogram.png")

