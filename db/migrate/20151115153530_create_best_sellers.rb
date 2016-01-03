class CreateBestSellers < ActiveRecord::Migration
  def change
    create_table :best_sellers do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
