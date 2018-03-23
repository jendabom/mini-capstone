class V1::OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.as_json
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    order = Order.new(
      user_id: current_user.id, 
      product_id: params[:product_id], 
      quantity: params[:quantity].to_i,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_subtotal + calculated_tax
    )
    if order.save
      render json: order.as_json
    else 
      render json: { errors: product.errors.full_messages }
    end
  end
end
