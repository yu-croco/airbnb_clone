class ChangeColumnTypeToPhotos < ActiveRecord::Migration[5.0]
 def up
  	change_column :photos, :listing_id, :integer, null: false
  end

  def down
  	change_column :photos, :listing_id, :string, null: false
  end
end
