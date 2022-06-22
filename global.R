library(shiny)
library(shinydashboard)
library(highcharter)
library(shinyjs)
library(readxl)
library(rlang)
library(broom)
library(DBI)
library(RMySQL)
library(tidyverse)




txt = read.delim('values.txt', header = FALSE)

mysqlconnection = dbConnect(RMySQL::MySQL(),
                            dbname = 'inflacion',
                            host = txt$V1[1],
                            port = as.numeric(txt$V1[2]),
                            user = txt$V1[3],
                            password = txt$V1[4])


dbListTables(mysqlconnection)

query = 'USE inflacion;'

dbGetQuery(mysqlconnection, query)

query = 'select * from inflacion_argentina'

df = dbGetQuery(mysqlconnection, query)

df$periodos = as.Date(df$periodos)

colnames(df) = c("Nivel general" ,"Alimentos y bebidas" ,"Bebidas alcoholicas y tabaco", "Prendias y Calzado" ,         
                    "Vivienda Agua y Elec", "Equip y Mant del Hogar" , "Salud"  , "Transporte" ,
                    "Comunicacion" ,"Recreacion y cultura" , "Educacion" ,  "Restaurantes y hoteles" ,
                    "Bienes y servicios varios"  ,  "periodos"    , "year"  ,   "Mes" ,"month"  )





set.seed(123)






valueBoxSpark <- function(value, title, sparkobj = NULL, subtitle, info = NULL, 
                          icon = NULL, color = "aqua", width = 4, href = NULL){
  
  shinydashboard:::validateColor(color)
  
  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")
  
  info_icon <- tags$small(
    tags$i(
      class = "fa fa-info-circle fa-lg",
      title = info,
      `data-toggle` = "tooltip",
      style = "color: rgba(255, 255, 255, 0.75);"
    ),
    # bs3 pull-right 
    # bs4 float-right
    class = "pull-right float-right"
  )
  
  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      if (!is.null(sparkobj)) info_icon,
      h3(value),
      if (!is.null(sparkobj)) sparkobj,
      p(subtitle)
    ),
    # bs3 icon-large
    # bs4 icon
    if (!is.null(icon)) div(class = "icon-large icon", icon, style = "z-index; 0")
  )
  
  if (!is.null(href)) 
    boxContent <- a(href = href, boxContent)
  
  div(
    class = if (!is.null(width)) paste0("col-sm-", width), 
    boxContent
  )
}