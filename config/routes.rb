Rails.application.routes.draw do
  namespace :v1 do
    get '/product/:id' => 'products#one_product'
    get '/product' => 'products#one_product'
    get '/all_products' => 'products#all_products'
  end
end
