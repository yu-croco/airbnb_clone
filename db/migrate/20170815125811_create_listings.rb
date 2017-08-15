class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :house_type
      t.integer :house_years
      t.string :house_size
      t.string :address
      t.string :listing_title
      t.text :listing_content
      t.integer :price_pernight
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
