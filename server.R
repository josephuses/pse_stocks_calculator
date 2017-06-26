
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("helpers.R")


shinyServer(function(input, output) {

  output$text1 <- renderText(
    {
      paste0("You bought ", input$buy_vol, " shares at ", input$buy_price, " pesos per share.")
    }
  )
  
  
  buyPrice <- reactive(input$buy_price)
  buyVolume <- reactive(input$buy_vol)
  sellPrice <- reactive(input$sell_price)
  sellVolume <- reactive(input$sell_vol)

  output$table <- renderTable({
    buy_price <- buyPrice()
    buy_vol <- buyVolume()
    sell_vol <- sellVolume()
    sell_price <- sellPrice()
    df <- stock_compute(buy_price = buy_price, buy_volume = buy_vol, sell_price = sell_price, sell_volume = sell_vol)
  }, striped = FALSE)
  
  output$text2 <- renderText(
    {
      paste0("Your gross buy price is: ", input$buy_vol * input$buy_price, " pesos.")
    }
  )
  
  output$text3 <- renderText(
    {
      paste0("Your buying commission is: ", min(20, input$buy_vol * input$buy_price * .0025), " pesos.")
    }
  )

  output$text4 <- renderText({
    paste0("Buying VAT: ", 0.12 * min(20, input$buy_vol * input$buy_price * .0025), " pesos.")
  })
  
  output$text5 <- renderText({
    paste0("PSE Buying Transaction Fee: ", 0.00005 * input$buy_vol * input$buy_price, " pesos.")
  })
  
  output$text6 <- renderText({
    paste0("Buying SCCP Fee: ", .0001 * input$buy_vol * input$buy_price, " pesos.")
  })

  output$text7 <- renderText({
    paste0("Total buying expenses: ", input$buy_vol * input$buy_price +  .0001 * input$buy_vol * input$buy_price + min(20, input$buy_vol * input$buy_price * .0025) + 0.12 * min(20, input$buy_vol * input$buy_price * .0025) + 0.00005 * input$buy_vol * input$buy_price + .0001 * input$buy_vol * input$buy_price, " pesos.")
  })
  
  
  output$text8 <- renderText(
    {
      paste0("You sold ", input$sell_vol, " shares at ", input$sell_price, " pesos per share.")
    }
  )
  
  output$text9 <- renderText(
    {
      paste0("Your gross sales is: ", input$sell_vol * input$sell_price, " pesos.")
    }
  )
  
  output$text10 <- renderText(
    {
      paste0("Your sales commission is: ", min(20, input$sell_vol * input$sell_price * .0025), " pesos.")
    }
  )
  
  output$text11 <- renderText({
    paste0("Sales VAT: ", 0.12 * min(20, input$sell_vol * input$sell_price * .0025), " pesos.")
  })
  
  output$text12 <- renderText({
    paste0("PSE Sales Transaction Fee: ", 0.00005 * input$sell_vol * input$sell_price, " pesos.")
  })
  
  output$text13 <- renderText({
    paste0("Sales SCCP Fee: ", .0001 * input$sell_vol * input$sell_price, " pesos.")
  })
  
  output$text14 <- renderText({
    paste0("Sales tax: ", .005 * input$sell_vol * input$sell_price, " pesos.")
  })
  
  output$text15 <- renderText({
    paste0("Total sales expenses: ", .0001 * input$sell_vol * input$sell_price + min(20, input$sell_vol * input$sell_price * .0025) + 0.12 * min(20, input$sell_vol * input$sell_price * .0025) + 0.00005 * input$sell_vol * input$sell_price + .0001 * input$sell_vol * input$sell_price + .005 * input$sell_vol * input$sell_price, " pesos.")
  })
  
  output$text16 <- renderText({
    paste0("Net sales: ", input$sell_vol * input$sell_price - (.0001 * input$sell_vol * input$sell_price + min(20, input$sell_vol * input$sell_price * .0025) + 0.12 * min(20, input$sell_vol * input$sell_price * .0025) + 0.00005 * input$sell_vol * input$sell_price + .0001 * input$sell_vol * input$sell_price + .005 * input$sell_vol * input$sell_price), " pesos.")
  })
  
  output$text18 <- renderText({
    paste0("Percentage earned: ", round(((input$sell_vol * input$sell_price -  (.0001 * input$sell_vol * input$sell_price + min(20, input$sell_vol * input$sell_price * .0025) + 0.12 * min(20, input$sell_vol * input$sell_price * .0025) + 0.00005 * input$sell_vol * input$sell_price + .0001 * input$sell_vol * input$sell_price)) / input$sell_vol - (input$buy_vol * input$buy_price +  .0001 * input$buy_vol * input$buy_price + min(20, input$buy_vol * input$buy_price * .0025) + 0.12 * min(20, input$buy_vol * input$buy_price * .0025) + 0.00005 * input$buy_vol * input$buy_price + .0001 * input$buy_vol * input$buy_price) / input$buy_vol) / ((input$buy_vol * input$buy_price +  .0001 * input$buy_vol * input$buy_price + min(20, input$buy_vol * input$buy_price * .0025) + 0.12 * min(20, input$buy_vol * input$buy_price * .0025) + 0.00005 * input$buy_vol * input$buy_price + .0001 * input$buy_vol * input$buy_price) / input$buy_vol) * 100, 2) , "%.")
  })
  
})
