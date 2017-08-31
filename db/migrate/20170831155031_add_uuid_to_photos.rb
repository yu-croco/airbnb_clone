class AddUuidToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :listing_id, type: :uuid, foreign_key: true
  end
end
