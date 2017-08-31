class ChangeColumnTypeToPhotos < ActiveRecord::Migration[5.0]
 def up
  	change_column :photos, :listing_id, :integer, null: false, foreign_key: :true
  end

  def down
  	change_column :photos, :listing_id, :string
  end
end
