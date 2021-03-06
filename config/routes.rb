Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy' 

    get '/suppliers' => 'suppliers#index'
    get '/suppliers/:id' => 'suppliers#show'
    post '/suppliers' => 'suppliers#create'
    patch '/suppliers/:id' => 'suppliers#update'
    delete '/suppliers/:id' => 'suppliers#destroy' 

    post '/users' => 'users#create'
    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'

    get '/categories' => 'categories#index'
    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
  end
end
