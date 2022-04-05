library(shiny)
library(leaflet)

# Define server
shinyServer(function(input, output) {
  output$Co2.1<-renderUI({
    pickerInput(
      inputId = "Id1",
      label = "Choose CO2 origin", 
      choices = list(
        Co2 = c("Coal","Oil","Cement","Flaring","Gas","Other_industry")
      ),
      selected = c("Coal","Oil","Cement"),
      multiple = TRUE)
  })
  output$GHG.1<-renderUI({
    pickerInput(
      inputId = "Id2",
      label = "Choose  GHG cause", 
      choices = list(
        GHG =c("Electricity.and.heat",
               "Transport",
               "Manufacturing.and.construction",
               "Agriculture",
               "Land.use.change.and.forestry",
               "Waste",
               "Industry",
               "Buildings",
               "Fugitive.emissions",
               "Aviation.and.shipping")),
      selected = c("Agriculture",
                   "Transport",
                   "Waste"),
      multiple = TRUE)
  })
  output$Co2<-renderUI({
    pickerInput(
      inputId = "Id1",
      label = "Choose CO2 origin", 
      choices = list(
        Co2 = c("Coal","Oil","Cement","Flaring","Gas","Other_industry")
      ),
      selected = c("Coal","Oil","Cement"),
      multiple = TRUE)
  })
  output$country1<-renderUI({
    pickerInput(
      inputId = "choix_pays",
      label = "Countries",
      choices = country,
      selected = "World",
      options = list('actions-box' = TRUE)
    )
  })
  output$year1<-renderUI({
    pickerInput(
      inputId = "choix_year",
      label = "Year",
      choices = year,
      selected = 2018,
      options = list('actions-box' = TRUE)
    )
  })
  
  output$country2<-renderUI({
    pickerInput(
      inputId = "choix_pays_2",
      label = "Countries",
      multiple = TRUE,
      choices = country,
      selected = c("Germany","China","Italy","France","Russia","Japan","India"),
      options = list('actions-box' = TRUE)
    )
  })
  output$year2<-renderUI({
    pickerInput(
      inputId = "choix_year_2",
      label = "Year",
      choices = year,
      selected = 2018,
      options = list('actions-box' = TRUE)
    )
  })
  output$Co2.2<-renderUI({
    pickerInput(
      inputId = "Id1_2",
      label = "Choose CO2 origin", 
      choices = list(
        Co2 = c("Coal","Oil","Cement","Flaring","Gas","Other_industry")
      ),
      selected = c("Coal","Oil","Cement"),
      multiple = TRUE
    )
  })
  output$GHG.2<-renderUI({
    pickerInput(
      inputId = "Id2_2",
      label = "Choose  GHG cause", 
      choices = list(
        GHG =c("Electricity.and.heat",
               "Transport",
               "Manufacturing.and.construction",
               "Agriculture",
               "Land.use.change.and.forestry",
               "Waste",
               "Industry",
               "Buildings",
               "Fugitive.emissions",
               "Aviation.and.shipping")),
      selected = c("Agriculture",
                   "Transport",
                   "Waste"),
      multiple = TRUE)
  })
  output$year3<-renderUI({
    sliderInput(
      inputId = "choix_annee",
      width = "430px",
      label = "YEAR",
      min = min(df_plot_co2$Year),
      max= max(df_plot_co2$Year),
      value="1995",
      sep="",
      step=1
    )
  })
  
  output$GHG.3<-renderUI({
    selectInput(
      inputId = "greenhouse_gas",
      label = "TYPE OF GREENHOUSE GAS",
      width = "430px",
      choices = c("co2","methane","nitrous_oxide","total_ghg"),
      selected = "co2")
  })
  
  output$info<-renderUI({
    actionBttn(
      inputId = "instructions_map",
      label = "Information", 
      style = "bordered",
      color = "primary",
      icon = icon("info-circle"),
      size = "sm"
    )
  })
  output$plot1 <- renderAmCharts({
    df_plot_co2_1_shiny <-df_plot_co2%>%
      filter(Country %in% data$Country)%>%
      filter(Country%in%input$choix_pays)
    df_plot_co2_1_shiny$Year <- strptime(df_plot_co2_1_shiny$Year, format = "%Y")
    amTimeSeries(df_plot_co2_1_shiny,"Year", input$Id1,
                 color = c("#CD5C5C", "#9F79EE", "#8B864E", "#CD00CD", "#3CB371", "#FF4500"),
                 type = "smoothedLine",
                 fillAlphas = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6),
                 xlab="Year", 
                 ylab="CO2 emissions by fuel type ( millions tonnes)", 
                 legend = TRUE, 
                 scrollbarHeight=20,
                 main = "CO2 emissions by fuel", export = TRUE, zoom = TRUE) 
  })
  
  output$plot2 <- renderAmCharts({
    df_plot_ghg1_shiny <-ghgdata%>%
      filter(Country %in% data$Country)%>%
      filter(Country%in%input$choix_pays)
    df_plot_ghg1_shiny$Year <- strptime(df_plot_ghg1_shiny$Year, format = "%Y")
    amTimeSeries(df_plot_ghg1_shiny,"Year", input$Id2,
                 color = c("#CD5C5C", "#9F79EE", "#8B864E", "#CD00CD", "#3CB371", "#FF4500", "#8B7D7B", "#EECFA1", "#FFC1C1", "#836FFF", "#FF82AB"),
                 type = "smoothedLine",
                 fillAlphas = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6),
                 xlab="Year", 
                 ylab="Total greenhouse gas emissions ( millions tonnes)", 
                 legend = TRUE,
                 scrollbarHeight=20,
                 main = "Total greenhouse gas emissions", export = TRUE, zoom = TRUE) 
  })
  
  output$plot3 <- renderAmCharts({
    df_plot_co2_2_shiny <- df_plot_co2_2_shiny_cap%>%
      filter(Country %in% data$Country) %>%filter(Country%in%input$choix_pays) %>% filter(Year==input$choix_year)
    a <- tibble::rownames_to_column(as.data.frame(t(df_plot_co2_2_shiny[input$Id1])))%>%
      arrange(desc(V1))
    amBarplot(a,x="rowname",
              y= "V1",
              color = c("#CD5C5C", "#9F79EE", "#8B864E", "#CD00CD", "#3CB371", "#FF4500"),
              xlab="Fuel type", 
              ylab="tonnes",main = "CO2 emissions per capita",depth = 10, horiz = TRUE, export = TRUE, zoom = TRUE)  
  })
  
  output$plot4 <- renderAmCharts({
    df_plot_ghg_2_shiny <- df_plot_ghg_cap%>%
      filter(Country %in% data$Country) %>%filter(Country%in%input$choix_pays) %>% filter(Year==input$choix_year)
    
    b <- tibble::rownames_to_column(as.data.frame(t(df_plot_ghg_2_shiny[input$Id2])))%>%arrange(desc(V1))
    
    amBarplot(b,x="rowname",y= "V1",xlab="Origin of the emissions", 
              ylab="tonnes", main = " Total greenhouse gas emissions per capita",depth = 10, horiz = TRUE, export = TRUE, zoom = TRUE)  
  })
  
  output$plot5<- renderPlotly({
    
    df_plot_compare_Co2_1_shiny <-df_plot_co2%>%
      filter(Country %in% data$Country) %>% 
      filter(Country%in% input$choix_pays_2)
    print(plot_ly(df_plot_compare_Co2_1_shiny, x = ~Year, y = ~co2, color = ~Country) %>% 
            add_lines()%>% layout(title = "Co2",yaxis = list(title = "Co2( millions tonnes)")))
    
  })
  
  output$plot6<- renderPlotly({
    df_plot_compare_GHG_1_shiny <- data %>%
      filter(Country%in% input$choix_pays_2)
    print(plot_ly(df_plot_compare_GHG_1_shiny, x = ~Year.x, y = ~total_ghg, color = ~Country) %>% 
            add_lines()%>% layout(title = "Greenhouse gas emissions",yaxis = list(title = "GHG( millions tonnes)"),xaxis =list(title = "Year")))
  })
  
  output$plot7 <- renderAmCharts({
    df_plot_compare <- df_plot_co2%>%
      filter(Country %in% input$choix_pays_2 )%>% 
      filter(Year==input$choix_year_2)
    
    m <- df_plot_compare %>%
      mutate("Sum" = rowSums(df_plot_compare[,input$Id1_2],na.rm=TRUE))%>%
      arrange(desc(Sum))
    
    amBarplot(y= input$Id1_2,x="Country", data = m, stack_type = "regular", horiz = TRUE,zoom = TRUE, legend=TRUE,
              main = "CO2 emissions") 
  })
  
  output$plot8 <- renderAmCharts({
    df_plot_compare_ghg  <- ghgdata%>%
      filter(Country %in%  input$choix_pays_2 )%>% 
      filter(Year%in%input$choix_year_2)
    n <- df_plot_compare_ghg %>%
      mutate("Sum" = rowSums(df_plot_compare_ghg[,input$Id2_2],na.rm=TRUE))%>%
      arrange(desc(Sum))
    
    amBarplot(y= input$Id2_2,x="Country", data = n, stack_type = "regular", horiz = TRUE, zoom = TRUE, legend=TRUE,
              main = "GHG emissions")  
  })
  
  output$table_co2 <- renderDataTable({
    df_plot_co2%>%
      filter(Country %in% data$Country)%>%
      select(c("Country","Year","Coal","Oil","Cement","Flaring","Gas","Other_industry"))
  })
  
  output$table_co2_cap <- renderDataTable({
    df_plot_co2_2_shiny_cap%>%
      filter(Country %in% data$Country)%>%
      select(c("Country","Year","Coal","Oil","Cement","Flaring","Gas","Other_industry"))
  })
  
  output$table_GHG <- renderDataTable({
    ghgdata%>%
      filter(Country %in% data$Country)
  })
  
  output$table_GHG_cap <- renderDataTable({
    df_plot_ghg_cap%>%
      filter(Country %in% data$Country)
  })#######
  #Map
  #######
  
  data_depart <- inner_join(df_plot_co2[df_plot_co2$Year=="1995",], world_polygon, by="Country")
  
  # Colors
  pal <- colorNumeric(scales::seq_gradient_pal(low = "yellow", high = "red", space="Lab"), domain=data_depart[,"co2"])
  
  #Map without reactives
  
  output$map <- renderLeaflet({
    leaflet(data = data_depart) %>%
      #addTiles(urlTemplate = fond) %>%
      addTiles %>%
      setView(lng = lng_init, lat = lat_init, zoom = 2) %>%
      addPolygons(data = st_as_sf(data_depart, crs=4326) %>% slice(1:nrow(data_depart)),
                  weight=2,
                  smoothFactor=0.2,
                  fillColor = ~pal(data_depart[,"co2"]),
                  popup = ~paste(as.character(data_depart[,"Country"]),
                                 "<br> Rate of co2 : ",
                                 as.character(data_depart[,"co2"]),
                                 "<br> ( millions tonnes)",
                                 sep=""),
                  fillOpacity = 0.5,
                  opacity=0.7,
                  color='black',
                  stroke=TRUE,
                  highlightOptions = highlightOptions(color = "red", weight = 3)) %>%
      addLegend(title = paste("Rate of co2 <br> ( millions tonnes)"),
                position="bottomleft",
                pal = pal, 
                values = data_depart[,"co2"])
  })
  
  #Reactives from the inputs
  
  data_annee <- reactive ({
    df_plot_co2[df_plot_co2$Year == input$choix_annee,] 
  })
  
  data2 <- reactive({
    inner_join(data_annee(),world_polygon,by="Country")
  })
  
  colorpal <- reactive ({
    colorNumeric(scales::seq_gradient_pal(low = "yellow", high = "red", space = "Lab"), domain = data2()[,input$greenhouse_gas])
  })
  
  #Map update
  
  observe({
    pal <- colorpal()
    
    the_data <- data2()
    
    leafletProxy("map",data=the_data) %>%
      clearShapes() %>%
      addPolygons(data = st_as_sf(the_data, crs=4326) %>% slice(1:nrow(the_data)),
                  weight=2,
                  popup = ~paste(as.character(the_data[,"Country"]),
                                 "<br> Rate of ",as.character(input$greenhouse_gas), " : ",
                                 as.character(the_data[,input$greenhouse_gas]),
                                 "<br> ( millions tonnes)",
                                 sep=""),
                  smoothFactor = 0.2,
                  fillColor = ~pal(the_data[,input$greenhouse_gas]),
                  fillOpacity = 0.5,
                  opacity=0.7,
                  color='black',
                  stroke=TRUE,
                  highlightOptions = highlightOptions(color = "red", weight = 3)) %>%
      clearControls() %>%
      addLegend(title = paste("Rate of ",input$greenhouse_gas, "<br> ( millions tonnes)"),
                position="bottomleft",
                pal = pal,
                values = the_data[,input$greenhouse_gas])
  })
  
  #Information for the user
  
  observeEvent(input$instructions_map, {
    showModal(modalDialog(
      title = "Information",
      HTML("This map displays the rate of greenhouse gas emissions per country, depending on its type and the year you chose. 
    <br>
    Feel free to click on a country to show more details about the values represented.
    <br><br>
    Each data available is constructed according to the website <i> Our World In Data </i> (<a href = 'https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions'>link</a>)."),
      easyClose = T
    ))
  })
  
})
