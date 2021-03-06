
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("helpers.R")


shinyServer(function(input, output) {

  stock <- reactive(input$stock)
  buyPrice <- reactive(input$buy_price)
  buyVolume <- reactive(input$buy_vol)
  sellPrice <- reactive(input$sell_price)
  sellVolume <- reactive(input$sell_vol)

  output$caption <- renderText(stock())
  
  output$table <- renderTable({
    buy_price <- buyPrice()
    buy_vol <- buyVolume()
    sell_vol <- sellVolume()
    sell_price <- sellPrice()
    df <- stock_compute(buy_price = buy_price, buy_volume = buy_vol, sell_price = sell_price, sell_volume = sell_vol)
  }, digits = 4)
})