class AddColumnLargeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :large, :string
    add_column :photos, :small, :string
  end
end
