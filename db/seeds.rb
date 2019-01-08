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
