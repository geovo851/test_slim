class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.text :description
      t.references :gender, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
