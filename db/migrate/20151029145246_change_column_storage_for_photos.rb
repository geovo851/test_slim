class ChangeColumnStorageForPhotos < ActiveRecord::Migration
  rename_column :photos, :storage, :orig
end
