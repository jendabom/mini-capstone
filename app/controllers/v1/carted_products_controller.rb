class V1::CartedProductsController < ApplicationController

  def index
    carted_product = CartedProduct.where(user_id: current_user.id, status: "carted")
    render json: carted_product.as_json
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id, 
      product_id: params[:product_id], 
      quantity: params[:quantity], 
      status: "carted"
    )
    if carted_product.save
      render json: carted_product.as_json
    else 
      render json: { errors: carted_product.errors.full_messages }
    end
  end
end
