class ChangeColumnToListings < ActiveRecord::Migration[5.0]
  def up
  	change_column :listings, :house_type, :string, null: false
  	change_column :listings, :house_size, :string, null: false
  	change_column :listings, :active, :boolean, null: false, default: false
  	change_column :listings, :user_id, :integer, null: false
  end

  def down
  	change_column :listings, :house_type, :string
  	change_column :listings, :house_size, :string
  	change_column :listings, :active, :boolean
  	change_column :listings, :user_id, :integer
  end
end
