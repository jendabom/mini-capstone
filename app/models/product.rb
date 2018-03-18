class Product < ApplicationRecord
  belongs_to :supplier
  has_many :image

  validates :name, presence: true 
  validates :name, length: { maximum: 30}
  validates :price, presence: true 
  validates :price, numericality: true
  validates :description, length: { minimum: 10 }

  def as_json
    {
      id: id,
      name: name,
      price: price,
      description: description,
      discounted: is_discounted?, 
      total: total,
      supplier: supplier.as_json,
      image: image.as_json
    }
  end

  def is_discounted?
    price < 3
  end

  def tax
    price * 0.09
  end

  def total
    sum = price + tax
    sum.round(2)
  end
end
