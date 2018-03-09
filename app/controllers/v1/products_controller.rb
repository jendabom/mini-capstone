class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:input_name], 
      price: params[:input_price], 
      description: params[:input_description]
      )

    product.save
    render json: product.as_json
  end

  def show
    id = params[:id]
    product = Product.find(id)
    render json: product.as_json
  end

  def update
    id = params[:id]
    product = Product.find(id)
    product.update(
      name: params[:input_name], 
      price: params[:input_price], 
      description: params[:input_description]
      )

    render json: product.as_json
  end

  def destroy
    id = params[:id]
    product = Product.find(id)
    product.destroy
    render json: {message: "The product with id #{id} has been deleted."}
  end

end
