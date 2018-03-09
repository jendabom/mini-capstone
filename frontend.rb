require 'unirest'
require 'tty-table'

base_url = "localhost:3000/v1"

p "Please select what you would like to see:"
p "[1] See all products"
p "[2] See one product"
user_input = gets.chomp

if user_input == "2"
  response = Unirest.get("#{base_url}/product")
  product = response.body

  p "Name: #{product['name']}"
  p "Price: #{product['price']}"
  p "Description: #{product['description']}"

# table = TTY::Table.new ['Name','Price', 'Description'], [["#{product['name']}", "#{product['price']}", "#{product['description']}"]]
# table.render(:basic)

elsif user_input == "1exti"

  all_response = Unirest.get("#{base_url}/all_products")
  products = all_response.body

  products.each do |product|
    p "Name: #{product['name']}"
    p "Price: #{product['price']}"
    p "Description: #{product['description']}"
    p "-" * 30
  end
end