class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :photos

	validates :house_type, presence: true
	validates :house_years, presence: true
	validates :house_size, presence: true

	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	# validates :address, presence: true
	# validates :listing_title, presence: true
	# validates :listing_content, presence: true
	# validates :price_pernight, presence: true
end
