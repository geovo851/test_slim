class CreateCarouselProducts < ActiveRecord::Migration
  def change
    create_table :carousel_products do |t|
      t.references :product, index: true, foreign_key: true
      t.string :photo
      t.string :title

      t.timestamps null: false
    end
  end
end
