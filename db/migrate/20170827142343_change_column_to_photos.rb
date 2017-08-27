class ChangeColumnToPhotos < ActiveRecord::Migration[5.0]
  def up
  	change_column :photos, :listing_id, :string, null: false
  end

  def down
  	change_column :photos, :listing_id, :string
  end
end
