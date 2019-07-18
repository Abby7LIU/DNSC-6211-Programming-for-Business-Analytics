options(shiny.maxRequestSize=30*1024^2)
library(shiny)
library(leaflet)
library(dplyr)
library(shinythemes)
library(ggplot2)
library(GGally)
library(easyGgplot2)


ui <- fluidPage(

  
  includeCSS("styles.css"),
  # Change the theme to journal
  theme = shinytheme("superhero"),
  
  # Application title
  headerPanel("Restaurants Inspections in Manhattan and Brooklyn"),
  
  
  # Three sidebars for uploading files, selecting time slots and districts
  sidebarLayout(
    sidebarPanel(
      
      # Create a file input
      fileInput("file",h5("Upload revised.csv Here Please", style = "color:#7AADD2;"),
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      
      # Create a multiple checkbox input for time slot
      checkboxGroupInput("BORO",
                         h4("District:", style = "color:#7AADD2;"),
                         c("MANHATTAN","BROOKLYN")
      ),
      
      helpText("Please Select The District (Manhanttan or Brooklyn) You Want To Analyze"),
      helpText("You Can Choose More Than One"),
      
      hr(),
      
      # Create a multiple checkbox input for police districts
      checkboxGroupInput("GRADE",
                         h4("Inspection Grade:", style = "color:#7AADD2;"),
                         choices = list("Grade A"= 'A',"Grade B"= 'B',"Grade C"= 'C',"Pening"= 'P',
                                        "Grade pending"= 'Z',"Not Yet Garded"= 'Not Yet Garded')
                                        
      ),
      
      helpText("Please Select The Grade You Want To Analyze"),
      helpText("You Can Choose More Than One")
    ),
    
    # Make the sidebar on the right of the webpage
    position = "right",
    fluid = TRUE,
    
    
    
    # Create two tabs
    mainPanel(
      tabsetPanel(type="tabs",
                  
                  #Add a tab for problem description
                  tabPanel(p("Project Description",style = "color:#4781B8;"),
                           
                           h3('Data Description', style = "color:#7AADD2;"),
                           textOutput("text1"),
                           
                           hr(),
                           
                           h3('App Guidance', style = "color:#7AADD2;"),
                           p('NY Restaurants.csv is the original dataset downloaded from the website. Clean the data.R
                             transform the it into revised.csv. '),
                           strong('For this app, revised.csv should be uploaded', style = "color:#F1AD4E;"),
                           
                           hr(),
                           
                           h3('Quetsion Description', style = "color:#7AADD2;"),
                           textOutput("text2"),
                           hr(),
                           p('The source of the data can be found:' ),
                           a("Data Source", class = "btn btn-primary btn-md", 
                           href = "https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j")
                           ),
           
                  
                  
                  tabPanel(p("Descriptive Analysis",style = "color:#4781B8;"), 
                           
                           #Add two subtabs
                           tabsetPanel(
                             tabPanel(p("Histgram of Restaurants Types ",style = "color:#7AADD2;"),
                
                                      
                                      fluidRow(column(8,plotOutput("plot1")),
                                               column(4,h4('Histgram of of Restaurants Types', style = "color:#7AADD2;"),
                                      textOutput("text3")))),
                                      
                             
                             tabPanel(p("Types and Grades ",style = "color:#7AADD2;"), 
                                      verbatimTextOutput("table1"),
                                      hr(),
                                      fluidRow(column(8,plotOutput("plot2")),
                                               column(4,h4('Analysis of the plot',style = "color:#7AADD2;"),
                                                      textOutput("text4")))
                                      
                                      
                                                
                                                )
      
              
                           )
                  ),
                  
                  #Tab for the Leaflet Map
                  tabPanel(p("Map",style = "color:#4781B8;"), leafletOutput("map", height=580))
              
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Create an output variable for problem description
  output$text1 <- renderText({
    
    "This project uses the dataset 'DOHMH New York City Restaurant Inspection Results', which contains the 
    information about the New York restaurant inspection results within the last three years.It is a huge 
    dataset with 200,000 rows, the programmer selects 10 types of restaurants that the inspections taken place 
    in Manhattan and Brooklyn in 2018 for analysis. The revised database has about 20000 rows. Then the programmer 
    deletes several unnecessary columns and uses zip code to create longitude and latitude. "
    
  })
  
  output$text2 <- renderText({
    
    "The question of this project is to explore how locations and types of the restaurants effect its insepction results.To solve the
    problem, we draw a map to locate the restaurants recorded and distinguish their types by color. Moreover, bottons are created so that
    users can choose the grades and the dintricts of the restaurants. And some statistic plots and tables are presented."
    
  })
  
  
 
  
  # Create a map output variable
  output$map <- renderLeaflet({
    
    # Connect to the sidebar of file input
    inFile <- input$file
    
    if(is.null(inFile))
      return(NULL)
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)

    
    # Filter the data for different time slots and different districts
    target1 <- c(input$BORO)
    target2 <- c(input$GRADE)
    map_df <- filter(mydata, BORO %in% target1 & GRADE %in% target2)
    
    # Create colors with a categorical color function
    color <- colorFactor(rainbow(9), map_df$CUISINE.DESCRIPTION)
    
    # Create the leaflet function for data
    leaflet(map_df) %>%
      
      # Set the default view
      setView(lng = -73.9965, lat = 40.7507, zoom = 12) %>%
      
      # Provide tiles
      addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>%
      
      # Add circles
      addCircleMarkers(
        radius = 2,
        lng= map_df$longitude,
        lat= map_df$latitude,
        stroke= FALSE,
        fillOpacity=0.1,
        color=color(CUISINE.DESCRIPTION)
      ) %>%
      
      # Add legends for different types of crime
      addLegend(
        "bottomleft",
        pal=color,
        values=CUISINE.DESCRIPTION,
        opacity=0.7,
        title="Type of Restaurants"
      )
  })
  
  output$plot1 <- renderPlot({
    inFile <- input$file
    
    if(is.null(inFile))
      return(NULL)
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)
    
    target1 <- c(input$BORO)
    target2 <- c(input$GRADE)
    plotdata <- filter(mydata, BORO %in% target1 & GRADE %in% target2)
    
    g <- ggplot(plotdata, aes(CUISINE.DESCRIPTION)) + geom_bar(aes(fill=factor(GRADE)))+
      scale_fill_brewer(direction = -1)
    
    
    
    g <- g + theme(plot.background = element_rect(fill = "tan2"))
    g + theme(
      panel.background = element_rect(fill = "tan2",
                                      colour = "tan2",
                                      size = 0.5, linetype = "solid"),
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "white"), 
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "white"),
      panel.border = element_rect(fill=NA,color='tan2', size=0.05, 
                                  linetype="solid")
    )
    
    
  })
  
  output$text3 <- renderText({
    "The plot shows the distribution of the 10 types of restaurants in Manhattan and Brooklyn.
    It indicates that the number of 'American' restaurants is the most. However, it is hard to say from the 
    plot that there is a relationship between restaurant type and inspection grade."
    
  })
  
  output$table1 <- renderPrint({
    
    # Connect to the sidebar of file input
    inFile <- input$file
    
    if(is.null(inFile))
      return("Please Upload A File For Analysis")
  
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)
    
    # Filter the data for different time slots and different districts
    target1 <- c(input$BORO)
    target2 <- c(input$GRADE)
    plotdata <- filter(mydata, BORO %in% target1 & GRADE %in% target2)
    
    
    # Create a table for offense
    table(plotdata$CUISINE.DESCRIPTION)
    
  })
  
  output$text4 <- renderText({'The plot on the left side shows the frequency of the scores for different kinds of 
    restaurants, lower scores indicates that the restaurant greater in the inspectation. We can see that for most types, the 
most number of restaurants has scores about 10 - 15, which indicates GRADE A. However, the type STEAK has some restaurants which
    have scores as high as 50 -75. ' 
  })
  
  output$plot2 <- renderPlot({
    inFile <- input$file
    
    if(is.null(inFile))
      return(NULL)
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)
    
    
    
    g <- ggplot2.histogram(data=mydata, xName='SCORE',
                           groupName='CUISINE.DESCRIPTION', legendPosition="top")
    
    g + theme(plot.background = element_rect(fill = "#EBEBEB"))
  
    
  })
  
  

}

# Run the application 
shinyApp(ui = ui, server = server)


