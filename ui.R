
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
      numericInput("sell_vol", "Sale Volume", value = "100", min = 0),
      numericInput("sell_price", "Sale Price", value = "110.00", min = 0)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      helpText(h2("Instructions"),
               p("This is a stock calculator based on the Philippine Stocks Exchange. Type the buying volume, sale volume, buying price, and sale price in their corresponding boxes in the side panel. The", strong("computations"), "will automatically appear in the 'Calculations' section."),
               br(),
               h2("Calculations"),
               h3("Buy Expenses")),
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      textOutput("text4"),
      textOutput("text5"),
      textOutput("text6"),
      textOutput("text7"),
      textOutput("text17"),
      #br(),
      helpText(h3("Sales")),
      textOutput("text8"),
      textOutput("text9"),
      textOutput("text10"),
      textOutput("text11"),
      textOutput("text12"),
      textOutput("text13"),
      textOutput("text14"),
      textOutput("text15"),
      textOutput("text16"),
      textOutput("text18"),
      helpText(h3("To Do")),
               p("* Specify different sales volume that total the buying volume."),
      p("* Specify sales prices corresponding to the different sales volume."),
      p("* Calculate the net sales and net percentage income for each sales volume and price.")
      )
    )
  )
)
