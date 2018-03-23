class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def as_json
    {
      order_id: id,
      product: product.as_json
    }
  end
end
