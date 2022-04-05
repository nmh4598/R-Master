library(readr)
library(rAmCharts)
library(tidyverse)
library(tibble)
library(shiny)
library(ggplot2)
library(reshape2)
library(sf)
library(rnaturalearth)
library(leaflet)
library(plotly)
# Importation
co2data <- read.csv("Data/owid-co2-data.csv")
ghgdata<- read.csv("Data/ghg-emissions-by-sector.csv")
ghg_capdata<-read.csv("Data/per-capita-ghg-sector.csv")

# Clean data
df <- co2data[!is.na(co2data$iso_code), ][,c(2:5,7:18,48,49,52:53,54:55)]  

# PLOT 1:
df_plot_co2 <- df %>%  rename("Country"="country",
                              "Oil"="oil_co2",
                              "Coal"="coal_co2",
                              "Cement"="cement_co2",
                              "Flaring"="flaring_co2",
                              "Gas"="gas_co2",
                              "Other_industry"="other_industry_co2",
                              "Year"="year") %>% 
  filter((1989<Year)&(Year<2019))  

# PLOT 2:
ghgdata <- ghgdata %>% rename("Country"="Entity")

# PLOT 3: 
df_plot_co2_2_shiny_cap <- df %>%  rename("Cement"="cement_co2_per_capita",
                                          "Flaring"="flaring_co2_per_capita",
                                          "Coal"="coal_co2_per_capita",
                                          "Oil"="oil_co2_per_capita",
                                          "Gas"="gas_co2_per_capita",
                                          "Other_industry"="other_co2_per_capita",
                                          "Year"="year",
                                          "Country"="country")%>% 
  filter((1989<Year)&(Year<2019))

# PLOT 4:
df_plot_ghg_cap <- ghg_capdata %>%  rename("Aviation.and.shipping"="Aviation.and.shipping..per.capita.",
                                           "Land.use.change.and.forestry"="Land.use.change.and.forestry..per.capita.",
                                           "Manufacturing.and.construction"="Manufacturing.and.construction..per.capita.",
                                           "Fugitive.emissions"="Fugitive.emissions..per.capita.",
                                           "Agriculture"="Agriculture..per.capita.",
                                           "Buildings"="Buildings..per.capita.",
                                           "Electricity.and.heat"="Electricity.and.heat..per.capita.",
                                           "Industry"="Industry..per.capita.",
                                           "Transport"="Transport..per.capita.",
                                           "Waste"="Waste..per.capita.",
                                           "Country"="Entity")

data <- df_plot_co2 %>% inner_join(ghgdata,by="Country")
country<-unique(data$Country)
year<-unique(df_plot_co2$Year)

#Map

#Paris coordinates
lng_init =  2.29445670551736
lat_init = 48.85898532570373

fond = "//{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png"


world_polygon <- sf::st_read("Data/world_polygon.shp", options = "ENCODING=WINDOWS-1252")



