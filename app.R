
setwd('/Users/liujingyi/Documents/MSBA/6211/final')

library(shiny)

ui <- fluidPage(
   
   titlePanel("Census data"),
   
 
   sidebarLayout(
     sidebarPanel(
       
       # Input: Select a file ----
       fileInput("file", label = "Choose CSV File",accept = c(".csv")),
       
       # Sliders: create two sliders for columns and rows
       sliderInput("slider1", "Number of rows to show",
                   min=0, max=100, value = c(0,30) ),
       
       sliderInput("slider2","Number of columns to show",
                   min=0, max=10, value=c(0,10))
     ),
      
      # Show a plot of the generated distribution
      mainPanel(tableOutput("csvfile"))
   )
)

# Define server logic required to draw a histogram
server <- function(input, output,session) {
  
  output$csvfile <- renderTable({
    
    if (is.null(input$file))
      return(NULL)
    
   
   # define the output of the table
    csvfile <- read.csv (input$file$datapath, header = TRUE, sep = ",", quote = "\"")
    
    
      R <- nrow(csvfile)
      C <- ncol(csvfile)
      
      #updateSliderInput(session,"which variable", which to update) can update according to the inputfile.
      updateSliderInput(session, "slider1", max = R)
      updateSliderInput(session, "slider2", max = C)
      
      # Define the min and max of the slide
      minrow <- input$slider1[1]
      maxrow <- input$slider1[2]
      
      mincol <- input$slider2[1]
      maxcol <- input$slider2[2]
      
      csvfile[minrow:maxrow,mincol:maxcol]     
      
    
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

