class Product < ApplicationRecord
  def as_json
    {
      id: id,
      name: name,
      price: price,
      image_url: image_url,
      description: description,
      discounted: is_discounted?, 
      total: total
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
