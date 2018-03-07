Rails.application.routes.draw do
  get '/product' => 'products#one_product'
  get '/all_products' => 'products#all_products'
end
