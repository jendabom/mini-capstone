class AddQuantityToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :in_stock, :boolean
    add_column :products, :quantity_in_stock, :integer
  end
end
