#' get_data_help
#' Get text of the R documentation for an internal package dataset
#' @param dat a named dataset
#' @param packname the package name that the dataset comes from
#' @return Output: the full R documentation text for the dataset
#' @example helptxt<-get_data_help("mtcars","datasets")
#' @export

get_data_help<-function(dat,packname){
  dat=as.character(dat)
  packname=as.character(packname)
  find.package(packname)
  helptxt<-capture.output(tools::Rd2txt(utils:::.getHelpFile(utils::help(dat,paste0(packname))),options = list(sectionIndent = 0)))
return(helptxt)  
}

#' get_description_data
#' Get the description section for an internal package dataset
#' @param helptxt character string of R documentation for a dataset
#' @return Output: the Description text
#' @example get_description_data(helptxt)
#' @export

get_description_data<-function(helptxt){
  first<-which(grepl("n:",helptxt)==TRUE)
  last<-which(grepl("U_",helptxt)==TRUE)
  
  helptxt[first:last]
 }

#get_description_data(helptxt)
