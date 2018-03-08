class V1::ProductsController < ApplicationController
  def one_product
    product = Product.first
    render json: product.as_json
  end

  def all_products
    products = Product.all
    render json: products.as_json
  end
end
