library("shinyWidgets")
library(shinydashboard)
library(shiny)
library(leaflet)
source("global.R")
# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "Climat change"),
  dashboardSidebar(
    sidebarMenu(id = "sidebar",
                menuItem("PRESENTATION",
                         tabName="tab_presentation",
                         icon=icon("user-friends")
                ),
                menuItem("MAP",
                         tabName="tab_map",
                         icon=icon("globe-americas")
                         
                ),
                menuItem("STATISTICS",
                         tabName="tab_stats",
                         icon=icon("chart-bar"
                         ),
                         menuSubItem(text = "Co2 and GHG",
                                     tabName = 'subtab_stats_Co2_GHG'
                         ),
                         conditionalPanel(
                           condition = "input.sidebar=='subtab_stats_Co2_GHG'",
                           uiOutput("Co2.1"),
                           uiOutput("GHG.1"),
                           uiOutput("country1"),
                           uiOutput("year1")
                         ),
                         conditionalPanel(
                           condition = "input.sidebar=='subtab_stats_Co2_GHG'"
                          
                         ),
                         menuSubItem(text = "Comparison",
                                     tabName = "subtab_stats_comparison"
                         ),
                         conditionalPanel(
                           condition = "input.sidebar=='subtab_stats_comparison'",
                           uiOutput("country2"),
                           uiOutput("year2"),
                           uiOutput("Co2.2"),
                           uiOutput("GHG.2")
                           
                         ),
                         conditionalPanel(
                           condition = "input.sidebar=='subtab_stats_comparison'"
                           
                           
                           
                         )
                ),
                menuItem("Data",
                         tabName="tab_data",
                         icon=icon("table"
                         ),menuSubItem(text = "Co2",
                                       tabName = 'subtab_Co2'
                         ),
                         menuSubItem(text = "Co2 per capita",
                                     tabName = "subtab_Co2_cap"
                         ),
                         menuSubItem(text = "GHG",
                                     tabName = "subtab_GHG"
                         ),
                         menuSubItem(text = "GHG per capita",
                                     tabName = "subtab_GHG_cap"
                         )
                ),
                
                conditionalPanel(
                  condition = "input.sidebar=='tab_map'",
                  uiOutput("year3")
                  
                  
                  #Choice of the year
                  ,
                  uiOutput("GHG.3")
                  #Choice of the greenhouse gas
                  ,
                  uiOutput("info")
                  #Information for the user
                  
                )
                
    )
    
    
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab_presentation",
              tags$div(
                tags$img(src = "https://youmatter.world/app/uploads/sites/2/2019/05/greenhouse-co2-climate.jpg",style="display: block; margin-left: auto; margin-right: auto;", width = "500px", height = "300px"), 
                tags$h1("GREENHOUSE GAS EMISSIONS",align="center"),
                "It's important that we understand how the climate is changing. Greenhouse gases are responsible for global warming, which is already affecting our world today, a number of species of plants and animals have gone extinct, and more and more people suffer from extreme climates and natural disasters.",
                tags$br(),
                "The scientists from the United States and other countries, forecasts a temperature rise of 2.5 to 10 degrees Fahrenheit over the next century.",
                
                
                tags$br(),tags$br(),tags$h4(tags$b("BACKGROUND")), 
                "Scientists have high confidence that global temperatures will continue to rise for decades to come, largely due to greenhouse gases produced by human activities. Rising global temperatures are fuelling devastating extreme weather throughout the world, with spiralling impacts on economies and societies. Billions of work hours have been lost through heat alone.",
                tags$br(),
                "16 September 2021 (WMO)  - COVID-19 did not slow the relentless advance of climate change. There is no sign that we are growing back greener, as carbon dioxide emissions are rapidly recovering after a temporary blip due to the economic slowdown and are nowhere close to reduction targets. Greenhouse gas concentrations in the atmosphere continue at record levels.",
                
                
                tags$br(),tags$br(),tags$h4(tags$b("IN THIS R SHINY")), 
                "I. World map :  We focus on the main greenhouse gases, CO2, N2O, methane of each country.",
                tags$br(),
                "II. Statistics : Detailed of  CO2 emissions ang other GHG that come from human actions, such as burning of fossil fuels like coal, natural gas and oil. 
                        Offer a comparative look at the issue of emissions across countries.",
                tags$br(),
                "III. Datasets",
                
                tags$br(),tags$br(),tags$h4(tags$b("SOURCE")), 
                "CO2 emissions and fuels : ", tags$a(href="https://github.com/owid/co2-data", "Our World In Data,"),
                "with additional information from the ",tags$a(href="https://www.icos-cp.eu/science-and-impact/global-carbon-budget/2021", "ICOS"),
                tags$br(),
                "Green house gases emissions :",tags$a(href="https://www.climatewatchdata.org/data-explorer/historical-emissions?historical-emissions-data-sources=cait&historical-emissions-gases=all-ghg&historical-emissions-regions=All%20Selected&historical-emissions-sectors=total-including-lucf%2Ctotal-including-lucf&page=1", "the Climate Watch Data"),
                
                
                tags$br(),tags$br(), tags$h4(tags$b("AUTHORS")),
                
                "NGUYEN Manh Hung | PHAM Thi Minh Ngoc | DHENNIN Nolwenn",
              )
      ),
      tabItem(tabName = "subtab_stats_Co2_GHG",
              fluidPage( 
                box(amChartsOutput(outputId = "plot1")),
                box(amChartsOutput(outputId = "plot2")),
                box(amChartsOutput(outputId = "plot3")),
                box(amChartsOutput(outputId = "plot4"))
              )
      ),
      tabItem(tabName = "subtab_stats_comparison",
              fluidPage( 
                box(plotlyOutput("plot5")),
                box(plotlyOutput("plot6")),
                box(amChartsOutput(outputId = "plot7")),
                box(amChartsOutput(outputId = "plot8"))
              )
      ),  
      tabItem(tabName = "subtab_Co2", tabPanel("Table", 
                                               # titre avec css
                                               h1("Dataset", style = "color : #0099ff;text-align:center"),
                                               # table
                                               dataTableOutput("table_co2"))
              
      ),
      tabItem(tabName = "subtab_Co2_cap", tabPanel("Table", 
                                                   # titre avec css
                                                   h1("Dataset", style = "color : #0099ff;text-align:center"),
                                                   # table
                                                   dataTableOutput("table_co2_cap"))
              
      ),
      tabItem(tabName = "subtab_GHG", tabPanel("Table", 
                                               # titre avec css
                                               h1("Dataset", style = "color : #0099ff;text-align:center"),
                                               # table
                                               dataTableOutput("table_GHG"))
              
      ),
      tabItem(tabName = "subtab_GHG_cap", tabPanel("Table", 
                                                   # titre avec css
                                                   h1("Dataset", style = "color : #0099ff;text-align:center"),
                                                   # table
                                                   dataTableOutput("table_GHG_cap"))
              
      ),
      tabItem(tabName = "tab_map",
              
              leafletOutput("map", width = "100%", height = 600))
      
        
    )
  )
)

