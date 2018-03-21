class V1::ProductsController < ApplicationController
  before_action :authenticate_user
  
  def index
    search_term = params[:search]
    products = Product.order(id: :asc).where("name LIKE ?", "%#{search_term}%")
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:input_name], 
      price: params[:input_price], 
      description: params[:input_description]
    )
    if product.save
      render json: product.as_json
    else 
      render json: { errors: product.errors.full_messages }
    end
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
    if product.save
      render json: product.as_json
    else 
      render json: { errors: product.errors.full_messages }
    end
  end

  def destroy
    id = params[:id]
    product = Product.find(id)
    product.destroy
    render json: {message: "The product with id #{id} has been deleted."}
  end

end
