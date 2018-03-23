class Category < ApplicationRecord
  has_many :categoryProducts
  has_many :products, through: :categoryProducts
end
