class AddStripeFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :stripe_user_id, :string
  end
end
