class AddColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :total_price, :integer
  end
end
