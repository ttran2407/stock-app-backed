# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'

url = "https://api.iextrading.com/1.0/ref-data/symbols"

data = JSON.parse(RestClient.get(url).body)
data.each do |stock|

  Stock.create(symbol: stock['symbol'], name: stock['name'], iexId: stock['iexId'] )
end

Status.create(status_type: "PENDING")
Status.create(status_type: "COMPLETED")
Status.create(status_type: "CANCELED")

User.create(user_name: "demo-name", first_name:"Valentino", last_name:"Rossi", password: "123456",password_confirmation: "123456", cash: 100000)

Transaction.create(user_id: 1, stock_id: 7798, status_id: 2, quantity: 10, price:
340, stock_symbol: "TSLA", transaction_type: "BUY")
 Transaction.create(user_id: 1, stock_id: 14, status_id: 2, quantity: 7, price:
145, stock_symbol: "AAPL", transaction_type: "BUY")
  Transaction.create(user_id: 1, stock_id: 1805, status_id: 2, quantity: 9, price:
5.5, stock_symbol: "CVEO", transaction_type: "BUY")
Transaction.create(user_id: 1, stock_id: 674, status_id: 2, quantity: 4, price:
140,stock_symbol: "BABA", transaction_type: "BUY")

Watchlist.create(user_id: 1, stock_id: 7798, stock_symbol: "TSLA" )
Watchlist.create(user_id: 1, stock_id: 14, stock_symbol: "AAPL")
Watchlist.create(user_id: 1, stock_id: 1805, stock_symbol: "CVEO")
Watchlist.create(user_id: 1, stock_id: 674, stock_symbol: "BABA")
Watchlist.create(user_id: 1, stock_id: 676, stock_symbol: "BAC")

Ownedstock.create(user_id: 1, quantity: 2, stock_id: 7798, stock_symbol: "TSLA" )
Ownedstock.create(user_id: 1, quantity: 2, stock_id: 14, stock_symbol: "AAPL")
Ownedstock.create(user_id: 1, quantity: 2, stock_id: 1805, stock_symbol: "CVEO")
Ownedstock.create(user_id: 1, quantity: 2, stock_id: 674, stock_symbol: "BABA")
Ownedstock.create(user_id: 1, quantity: 2, stock_id: 676, stock_symbol: "BAC")
