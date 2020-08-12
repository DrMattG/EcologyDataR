library("here")
library("tidyverse")
library("XML")
library("methods")
library(xml2)

here()
files<-list.files(paste0(here(),"/data/xml_files"))

txt<-txt2<-list()
for (i in 1:length(files)){
  setwd(paste0(here(),"/data/xml_files"))
  x <- read_xml(files[i])
  txt[i]<-xml_text(x)
  txt2[i]<-sub(" .*Sampling description", "", txt[i])       
  txt2[i]<-substr(txt2[i],1,300)# average character length of a sentence is 75 - 100 I assume the first sentence tells us the sampling regime (yeah I know....:()
  setwd(here())
}

txt2[[5]]
