class CreateSliderProducts < ActiveRecord::Migration
  def change
    create_table :slider_products do |t|
      t.string :title
      t.text :body
      t.string :photo
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
