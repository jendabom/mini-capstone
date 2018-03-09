class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    id = params[:id]
    product = Product.find(id)
    render json: product.as_json
  end
end
