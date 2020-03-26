
### 주성분 분석
install.packages("ggplot2")
library(readr)
library(dplyr)
library(gmodels)
library(MASS)
require(graphics)
require(car)
library(ggplot2)
library(psych)
library(ppcor)
require(moonBook)
library(reshape)
library(lsmeans)


##데이터 불러오기

kosisdata <- read.csv("mean_kosis.csv")
row.names(kosisdata) = kosisdata[,1]


head(kosisdata)
farmer <- read.csv("farmer_av.csv")
data<- merge(kosisdata,farmer,by="loc")
nrow(data)
head(data)

##데이터 전처리
##컬럼 선택 (loc,mean_고령인구비율,mean_순이동인,mean_인구증가율,mean_전입인구,mean_전출인구,mean_합계출산율 제외)
sel.data<-data[,-1]
sel.data<-sel.data[,-3]
colnames(sel.data)
sel.data<-sel.data[,-8]
head(sel.data)
sel.data<-sel.data[,-16]
sel.data<-sel.data[,-c(17:18)]
colnames(sel.data)
sel.data<-sel.data[,-20]
colnames(sel.data)
sel.data<-sel.data[,-c(20:24)]## 년도별 귀농인구수 제외
sel.data<-sel.data[,-8]
sel.data<-sel.data[,-17]
colnames(sel.data)

#결측치제거
sel.data1 <- sel.data
sel.data1 <- na.omit(sel.data1)

#표준화
##귀농인구 빼고 표준화
sel.data1[,(1:17)] <- scale(sel.data1[,(1:17)])
sel.data1 <- as.data.frame(sel.data1)

#스크리도표
pca_r <- prcomp(sel.data1[,-18], scale = T)   
summary(pca_r)
screeplot(pca_r, type = "l") 
abline(h=1)


#요인분석
mypc.pm <- fa(sel.data1[,-18], nfactors = 5, rotate = 'promax', scores = 'regression')
print(mypc.pm)


#요인계수
fa_score <- mypc.pm$scores
fa_score <- as.data.frame(fa_score)
fa_score[,6] <- sel.data1[,18]

#회귀분석
fit_fa <- lm(V6 ~.,fa_score )
summary(fit_fa)
