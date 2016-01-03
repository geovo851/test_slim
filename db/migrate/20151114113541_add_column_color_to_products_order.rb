class AddColumnColorToProductsOrder < ActiveRecord::Migration
  def change
    add_reference :products_orders, :color, index: true, foreign_key: true
    add_reference :products_orders, :size, index: true, foreign_key: true
  end
end
