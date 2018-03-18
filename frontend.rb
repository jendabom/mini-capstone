require 'unirest'
require 'tty-prompt'

base_url = "localhost:3000/v1"
prompt = TTY::Prompt.new

p "Please select what you would like to see:"
p "[1] See all products"
p "[2] See one product"
p "[3] Add a product"
p "[4] Update a product"
p "[5] Delete a product"
p "[6] Add a user"
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

  p response.body

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
  p "[3] description"
  p "[4] all"
  user_input2 = gets.chomp

  if user_input2 == "1"
    p "Please enter the new product name: (currently: #{product["name"]})"
    input_name = gets.chomp
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: input_name, input_price: product['price'], input_description: product['description']})
    p response.body
  elsif user_input2 == "2"
    p "Please enter the price: (currently: #{product["price"]})"
    input_price = gets.chomp.to_i
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: product['name'], input_price: input_price, input_description: product['description']})
    p response.body
  elsif user_input2 == "3"
    p "Please enter a description: (currently: #{product["description"]})"
    input_description = gets.chomp
    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: product['name'], input_price: product['price'], input_description: input_description})
    p response.body
  else
    p "Please enter the new product name: (currently: #{product["name"]})"
    input_name = gets.chomp
    p "Please enter the updated price: (currently: #{product["price"]})"
    input_price = gets.chomp.to_i
    p "Please enter an updated description: (currently: #{product["description"]})"
    input_description = gets.chomp

    response = Unirest.patch("#{base_url}/products/#{input_id}", parameters: {input_name: input_name, input_price: input_price, input_description: input_description})
    p response.body
  end

elsif user_input == "5"
  system "clear"
  input_id = prompt.ask("What product would you like to delete?").to_i
  response = Unirest.get("#{base_url}/products/#{input_id}")
  product = response.body
  p "Confirm deletion (y/n)"
  confirmation = gets.chomp
  if confirmation == "y"
    response = Unirest.delete("#{base_url}/products/#{input_id}")
    p "The product was deleted."
  end
elsif user_input == "6"
  p "Add a User"
  input_name = prompt.ask("Please enter your name:")
  input_email = prompt.ask("Please enter your email:")
  input_password = prompt.mask("Please enter a password:")
  input_password_confirmation = prompt.mask("Please confirm password:")

  response = Unirest.post("#{base_url}/users", parameters: {name: input_name, email: input_email, password: input_password, password_confirmation: input_password_confirmation})
  p response.body

end
