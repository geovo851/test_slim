class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :adress
      t.string :role

      t.timestamps null: false
    end
  end
end
