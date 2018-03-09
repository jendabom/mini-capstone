require 'unirest'
require 'tty-table'

base_url = "localhost:3000/v1"

p "Please select what you would like to see:"
p "[1] See all products"
p "[2] See one product"
p "[3] Add a product"
user_input = gets.chomp

if user_input == "2"
  system "clear"
  p "What product would you like to see?"
  input_id = gets.chomp
  response = Unirest.get("#{base_url}/products/#{input_id}")
  product = response.body

  p "Name: #{product['name']}"
  p "Price: #{product['price']}"
  p "Description: #{product['description']}"

elsif user_input == "1"
  system "clear"
  all_response = Unirest.get("#{base_url}/products")
  products = all_response.body

  products.each do |product|
    p "Name: #{product['name']}"
    p "Price: #{product['price']}"
    p "Description: #{product['description']}"
    p "-" * 30
  end

elsif user_input == "3"
  system "clear"
  p "Please enter the new product name:"
  input_name = gets.chomp
  p "Please enter the price"
  input_price = gets.chomp.to_i
  p "Please enter a description"
  input_description = gets.chomp

  response = Unirest.post("#{base_url}/products", parameters: {input_name: input_name, input_price: input_price, input_description: input_description})
end