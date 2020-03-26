install.packages('wordcloud2')
install.packages('topicmodels')
install.packages("rJava")
install.packages("KoNLP")
options(java.parameters=c("-Xmx12g"))
install.packages("tidyverse")
Sys.setenv(JAVA_HOME='C://Program Files//Java//jre1.8.0_231')



library(rJava)
library(KoNLP)
library(tidyverse)
library(tibble)
library(topicmodels)
library(tidytext)
library(broom)
library(rJava)
library(arules) 
library(igraph) 
library(combinat) 
library(tm) 
library(proxy) 
library(stringr)
library(readxl)
library(dplyr)
library(RMySQL)
library(readr)
library(slam)
library(xlsx)
library(xlsxjars)
library(dplyr)
library(wordcloud2)

useSejongDic() 
useNIADic()

data14 <- read.csv("newsdata14-16.csv", header = T, encoding = "utf-8")
data17 <- read.csv("newsdata17-19.csv", header = T, encoding = "utf-8")



names(data14)[3] = c("contents")


data14$contents <- as.character(data14$contents)


names(data17)[3] = c("contents")



data17$contents <- as.character(data17$contents)

###################################################################################################################

## 14 - 16
data14$contents <- gsub("[a-zA-Z]"," " ,data14$contents ,ignore.case = TRUE)
data14$contents <- gsub('[~!@#$%&*()_+=?<>■▶]',' ',data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("[^가-힣]", " ", data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("\\d+"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("귀촌인"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("대상"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("올해"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("지난해"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("기자"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("가구"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("대표"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("아시아경제"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("귀농인"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("이번"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("희망하"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("귀농"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("귀촌"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("으로"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("귀농귀촌"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("전국"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("추진"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("사업"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("영동군"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("참석한"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("대전"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("실시"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("마련"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("다양한"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("안정적"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("도시"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("운영"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("전남"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("도내"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("진행"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("실시"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("박람회"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인생"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("사진"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("현장"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("이날"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("동안"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("과정"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("예비"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("실시"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("마을"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("제공"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("곡성군"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("충북"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("개최"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("사진"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("행사"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("민선"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("운영"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("조성"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("여명"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("가운데"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("연속"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("군민"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("이후"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("오전"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("오후"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("시작"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("분야"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("충주"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("서울"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("서울시"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("강원도"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("충남"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("교육"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("지원"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인구","인원" , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인원감소","인구감소" , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인원늘리기","인구늘리기" , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인원정책","인구정책" , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인원"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("농촌"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("지역"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("농업"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("정책"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("센터"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("프로그램"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("일자리"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("농업기술센터"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("농림축산식품부"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("인구늘리기"," " , data14$contents ,ignore.case = TRUE)
data14$contents <- gsub("감소"," " , data14$contents ,ignore.case = TRUE)


## 17 - 19
data17$contents <- gsub("[a-zA-Z]"," " ,data17$contents ,ignore.case = TRUE)
data17$contents <- gsub('[~!@#$%&*()_+=?<>■▶]',' ',data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("[^가-힣]", " ", data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("\\d+"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("귀촌인"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("대상"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("올해"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("지난해"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("기자"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("가구"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("대표"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("아시아경제"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("귀농인"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("이번"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("희망하"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("귀농"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("귀촌"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("으로"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("귀농귀촌"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("전국"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("추진"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("사업"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("영동군"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("참석한"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("대전"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("실시"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("마련"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("다양한"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("안정적"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("도시"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("운영"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("전남"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("도내"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("진행"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("실시"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("박람회"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인생"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("사진"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("현장"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("이날"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("동안"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("과정"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("예비"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("실시"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("마을"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("제공"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("곡성군"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("충북"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("개최"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("사진"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("행사"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("민선"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("운영"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("조성"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("여명"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("가운데"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("연속"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("군민"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("이후"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("오전"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("오후"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("시작"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("분야"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("충주"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("서울"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("서울시"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("강원도"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("충남"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("교육"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("지원"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인구","인원" , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인원감소","인구감소" , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인원늘리기","인구늘리기" , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인원정책","인구정책" , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인원"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("농촌"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("지역"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("농업"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("정책"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("센터"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("프로그램"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("일자리"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("농업기술센터"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("농림축산식품부"," " , data17$contents ,ignore.case = TRUE)
data17$contents <- gsub("인구늘리","인구늘리기" , data17$contents ,ignore.case = TRUE)



###################################################################################################################
## 단어추출함수
ko.words <- function(doc){
  d <- as.character(doc)
  #pos <- str_split(d,";")## 띄어쓰기(' ')를 기준으로 한 문장을 여러 단어로 나눔
  pos <- paste(SimplePos22(d))
  #extracted <- str_match(pos, "([가-힣a-zA-Z]+)/(NC|PA|PV)")#명사,동사, 형용사 동시에 가져옴
  extracted <- str_match(pos, "([가-힣a-zA-Z]+)/(NC)")#명사,동사, 형용사 동시에 가져옴
  
  keyword <- extracted[,2]
  keyword[!is.na(keyword)]
}
options(mc.cores=1)


#####################################################################################################################
##############TOTAL
#####################################################################################################################
library(tm)
farmpus14<- VCorpus(VectorSource(data14$contents))#형태소 분석이 된 데이터를 corpus로 만든다음, tdm 작성
farmpus14[[1]]$content
tdm14 <- TermDocumentMatrix(farmpus14,
                               control=list(tokenize=ko.words,
                                            removePunctuation=T,
                                            removeNumbers=T,
                                            wordLengths=c(2, 10)))
farm14_tdm <- tdm14
#####################################################################################################################

farm14_tdm_rm <- removeSparseTerms(farm14_tdm, sparse = 0.99)
farm14_tdm_mat <- as.matrix(farm14_tdm_rm)
farm14_tdm_mat <- as.matrix(farm14_tdm_mat)
v14 <- sort(slam::row_sums(farm14_tdm_mat), decreasing = T)
data14_v <- data.frame(word=names(v14),freq=v14)
#farm18_word <-head(sort(data18_v, decreasing = T),100)
#word_weibo <- data.frame(word=names(v),freq=v)
library(wordcloud2)
wordcloud2(data = data14_v, size = 1.5, 
           fontFamily = 'HY나무', fontWeight = 'bold', shape = 'circle')

#####################################################################################################################
##############17
#####################################################################################################################
library(tm)
farmpus17<- VCorpus(VectorSource(data17$contents))#형태소 분석이 된 데이터를 corpus로 만든다음, tdm 작성
farmpus17[[1]]$content
tdm17 <- TermDocumentMatrix(farmpus17,
                               control=list(tokenize=ko.words,
                                            removePunctuation=T,
                                            removeNumbers=T,
                                            wordLengths=c(2, 10)))
farm17_tdm <- tdm17
#####################################################################################################################

farm17_tdm_rm <- removeSparseTerms(farm17_tdm, sparse = 0.99)
farm17_tdm_mat <- as.matrix(farm17_tdm_rm)
farm17_tdm_mat <- as.matrix(farm17_tdm_mat)
v17 <- sort(slam::row_sums(farm17_tdm_mat), decreasing = T)
data17_v <- data.frame(word=names(v17),freq=v17)
#farm18_word <-head(sort(data18_v, decreasing = T),100)
#word_weibo <- data.frame(word=names(v),freq=v)
#library(wordcloud2)
wordcloud2(data = data17_v, size = 1.5, 
           fontFamily = 'HY나무', fontWeight = 'bold', shape = 'circle')
