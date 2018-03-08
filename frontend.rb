require 'unirest'
require 'tty-table'

response = Unirest.get("localhost:3000/product")
product = response.body

# p "Name: #{product['name']}"
# p "Price: #{product['price']}"
# p "Description: #{product['description']}"

table = TTY::Table.new ['Name','Price', 'Description'], [["#{product['name']}", "#{product['price']}", "#{product['description']}"]]
table.render(:basic)

# all_response = Unirest.get("localhost:3000/all_products")
# products = all_response.body

# products.each do |product|
#   p "Name: #{product['name']}"
#   p "Price: #{product['price']}"
#   p "Description: #{product['description']}"
#   p "-" * 30
# end