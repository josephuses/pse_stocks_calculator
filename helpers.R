# helpers.R

stock_compute <- function(buy_price, buy_volume, sell_price = NULL, sell_volume = NULL){
  # output for buying
  
  gross_buy_amount = buy_price * buy_volume
  buy_commission = .0025 * gross_buy_amount
  buy_vat = 0.12 * buy_commission
  buy_pse_trans_fee = 0.00005 * gross_buy_amount
  buy_sccp = 0.0001 * gross_buy_amount
  
  # output for selling
  
  gross_sale_amount = sell_price * sell_volume
  sell_commission = .0025 * gross_sale_amount
  sell_vat = .12 * sell_commission
  sell_pse_trans_fee = 0.00005 * gross_sale_amount
  sell_sccp = 0.0001 * gross_sale_amount
  sales_tax = sell_volume * sell_price * .005 
  
  # other outputs
  
  total_buy_amount = gross_buy_amount + buy_commission + buy_vat + buy_pse_trans_fee + buy_sccp
  ave_price = total_buy_amount / buy_volume
  net_sale_amount = gross_sale_amount - sell_commission - sell_vat - sell_pse_trans_fee - sell_sccp - sales_tax
  percentage_income = round((net_sale_amount / sell_volume - ave_price) / ave_price * 100, 2)
  income = net_sale_amount - ave_price * sell_volume
  
  
  df <- data.frame(Item = c("Gross Buy Price", "Buying Commission", "Buying VAT", "Buying PSE Transaction Fee", "Buying SCCP", "Total Buying Amount", "Average Price", "Gross Sale Amount", "Sales Commission", "Sales VAT", "Sales PSE Transaction Fee", "Sales SCCP", "Sales Tax", "Net Sale Amount", "Percentage Income", "Income"),
                   Amount = c(gross_buy_amount, buy_commission, buy_vat, buy_pse_trans_fee, buy_sccp, total_buy_amount, ave_price, gross_sale_amount, sell_commission, sell_vat, sell_pse_trans_fee, sell_sccp, sales_tax,   net_sale_amount, percentage_income, income))
  
  if_not_null <- return(df)
  
  if_null <- return(df[1:7,])
  
  ifelse(is.null(sell_price), if_null, if_not_null)
  
}