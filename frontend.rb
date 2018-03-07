require 'unirest'

# response = Unirest.get("localhost:3000/product")
# product = response.body

# p "Name: #{product['name']}"
# p "Price: #{product['price']}"
# p "Description: #{product['description']}"

all_response = Unirest.get("localhost:3000/all_products")
products = all_response.body

products.each do |product|
  p "Name: #{product['name']}"
  p "Price: #{product['price']}"
  p "Description: #{product['description']}"
  p "-" * 30
end