
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("PSE Stocks Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("buy_vol", "Buy Volume", value = "100", min = 0),
      numericInput("buy_price", "Buy Price", value = "100.00", min = 0),
      numericInput("sell_vol", "Sale Volume", value = NULL, min = 0),
      numericInput("sell_price", "Sale Price", value = NULL, min = 0),
      submitButton(text = "Submit")
    ),
    

    
    

    # Show a plot of the generated distribution
    mainPanel(
      helpText(h2("Instructions"),
               p("This is a stock calculator based on the Philippine Stocks Exchange. Type the buying volume, sale volume, buying price, and sale price in their corresponding boxes in the side panel. The", strong("computations"), "will automatically appear in the 'Calculations' section."),
               br(),
               h2("Calculations"),
      tableOutput("table")
      )
    )
  )
))
