class V1::ProductsController < ApplicationController
  def one_product
    id = params["id"].to_i
    product = Product.find(id)
    render json: product.as_json
  end

  def all_products
    products = Product.all
    render json: products.as_json
  end
end
