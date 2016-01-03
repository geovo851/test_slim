class CreateProductsOrders < ActiveRecord::Migration
  def change
    create_table :products_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.float :quantity, default: 0
      t.float :price, default: 0

      t.timestamps null: false
    end
  end
end
