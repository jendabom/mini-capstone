class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def make_purchase
    
  end
end
