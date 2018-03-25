class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, :through => :carted_products

  def as_json
    {
      order_id: id,
      product: product.as_json
    }
  end
end
