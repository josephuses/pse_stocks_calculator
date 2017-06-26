# helpers.R

stock_compute <- function(buy_price, buy_volume, sell_price, sell_volume){
  # output for buying
  
  gross_buy_amount = buy_price * buy_volume
  buy_commission = min(20, .0025 * gross_buy_amount) 
  buy_vat = 0.12 * buy_commission
  buy_pse_trans_fee = 0.00005 * gross_buy_amount
  buy_sccp = 0.0001 * gross_buy_amount
  
  # output for selling
  
  gross_sale_amount = sell_price * sell_volume
  sell_commission = min(20, .0025 * gross_sale_amount) 
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
  
  return(list(gross_buy_amount = gross_buy_amount,
              buy_commission = buy_commission, 
              buy_vat = buy_vat,
              buy_pse_trans_fee = buy_pse_trans_fee,
              buy_sccp = buy_sccp,
              gross_sale_amount = gross_sale_amount,
              sell_commission = sell_commission, 
              sell_vat = sell_vat,
              sell_pse_trans_fee = sell_pse_trans_fee,
              sell_sccp = sell_sccp,
              sales_tax = sales_tax, 
              total_buy_amount = total_buy_amount,
              ave_price = ave_price,
              net_sale_amount = net_sale_amount,
              percentage_income = percentage_income,
              income = income))
}