
# loading libraries #
library(shiny)
library(shinydashboard)
library(shinythemes)
library(shinyjs)
library(dplyr)
library(readr)
library(DT)
library(data.table)
library(tidyverse)
library(zoo) 
library(lubridate)
library(ggplot2)
library(tableHTML)
library(ggvis)
library(treemap)
library(d3treeR)
library(colorspace)

source("data_feed.R")

dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Tool"), 
  
  
  dashboardSidebar(
    sidebarMenu(
              menuItem("Dashboard", tabName = "dashboard", icon = icon("th"))
      )),
  
  dashboardBody(
    tags$head(tags$style(HTML('.info-box {min-height: 45px;} .info-box-icon {height: 45px; line-height: 45px;} .info-box-content {padding-top: 0px; padding-bottom: 0px;}'))),
    useShinyjs(),
    tabItems(
      tabItem(tabName = "dashboard",
              
              bootstrapPage(
                ui = fluidPage( tags$head(tags$script(src = "message-handler.js")),#para poder enviar msjs 
                                theme = shinytheme("cerulean"),
                                titlePanel(tags$b("Tool Configuration")),
                                       
                                       navbarPage(title = tags$b('< - >'),
                                                  
                                                  tabPanel("Status Reports", 
                                                           fluidRow(
                                                                    
                                                                        infoBox(width = 15,
                                                                                tags$h3("All IOTs Accounts Summary"), 
                                                                                selectInput("d_Year",
                                                                                            "Year In Scope",
                                                                                            c(" All"),multiple=FALSE, selectize=TRUE)
                                                                        ),
                                                                    
                                                                    d3tree2Output("master_geo_tree")
                                                             )
                                                           )
                                                  )
                                      )
                            )
              )
            )
          )
  )