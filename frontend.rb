require 'unirest'
require 'tty-table'

base_url = "localhost:3000/v1"

p "Please select what you would like to see:"
p "[1] See all products"
p "[2] See one product"
p "[3] Add a product"
p "[4] Update a product"
p "[5] Delete a product"
user_input = gets.chomp

# show a specified product
if user_input == "2"
  system "clear"
  p "What product would you like to see?"
  input_id = gets.chomp
  response = Unirest.get("#{base_url}/products/#{input_id}")
  product = response.body

  p "Id: #{product['id']}"
  p "Name: #{product['name']}"
  p "Price: #{product['price']}"
  p "Description: #{product['description']}"

# show all products
elsif user_input == "1"
  system "clear"
  all_response = Unirest.get("#{base_url}/products")
  products = all_response.body

  products.each do |product|
    p "Id: #{product['id']}"
    p "Name: #{product['name']}"
    p "Price: #{product['price']}"
    p "Description: #{product['description']}"
    p "-" * 30
  end

# Create a new Product
elsif user_input == "3"
  system "clear"
  p "Please enter the new product name:"
  input_name = gets.chomp
  p "Please enter the price"
  input_price = gets.chomp.to_i
  p "Please enter a description"
  input_description = gets.chomp

  response = Unirest.post("#{base_url}/products", parameters: {input_name: input_name, input_price: input_price, input_description: input_description})

elsif user_input == "4"
  system "clear"
  p "What product would you like to see?"
  input_id = gets.chomp.to_i
  response = Unirest.get("#{base_url}/products/#{input_id}")
  product = response.body

  p "Id: #{product['id']}"
  p "Name: #{product['name']}"
  p "Price: #{product['price']}"
  p "Description: #{product['description']}"

  p "What would you like to update?"
  p "[1] name"
  p "[2] price"
  p "[3] desciption"
  p "[4] all"
  user_input2 = gets.chomp

  if user_input2 == "1"
    p "Please enter the new product name: (currently: #{product["name"]})"
    input_name = gets.chomp
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: input_name, input_price: product['price'], input_description: product['description']})
  elsif user_input2 == "2"
    p "Please enter the price: (currently: #{product["price"]})"
    input_price = gets.chomp.to_i
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: product['name'], input_price: input_price, input_description: product['description']})
  elsif user_input2 == "3"
    p "Please enter a description: (currently: #{product["description"]})"
    input_description = gets.chomp
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: product['name'], input_price: product['price'], input_description: input_description})
  else
    p "Please enter the new product name: (currently: #{product["name"]})"
    input_name = gets.chomp
    p "Please enter the updated price: (currently: #{product["price"]})"
    input_price = gets.chomp.to_i
    p "Please enter an updated description: (currently: #{product["description"]})"
    input_description = gets.chomp

    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: input_name, input_price: input_price, input_description: input_description})
  end

elsif user_input == "5"
  system "clear"
  p "What product would you like to delete?"
  input_id = gets.chomp.to_i
  response = Unirest.get("#{base_url}/products/#{input_id}")
  product = response.body
  p "Confirm deletion (y/n)"
  confirmation = gets.chomp
  if confirmation == "y"
    response = Unirest.delete("#{base_url}/products/#{input_id}")
    p "The product was deleted."
  end

end
