class AddUuidToListing < ActiveRecord::Migration[5.0]
  def change
    add_reference :listings, :user_id, type: :uuid, foreign_key: true
  end
end
