class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :publishable_key, :string
    add_column :users, :secret_key, :string
    add_column :users, :currency, :string
  end
end
