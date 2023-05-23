library(shiny)
library(readr)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("My first Shiny App"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(

      
      
      # Input file selection
      fileInput("file1", "Your CSV file",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/plain",
                           ".csv")),
      
    ),
    
    # Show table of data
    mainPanel(
      tableOutput("contents")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Read CSV file into data frame
  fileData <- reactive({
    req(input$file1)
    inFile <- input$file1
    
    if (is.null(inFile)) {
      return(NULL)
    }
    
    # Use specific CSV file in your Shiny app
    df <- read_csv("Test_Data.csv")
    
    df
  })
  
  # Display data in table
  output$contents <- renderTable({
    fileData()
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

