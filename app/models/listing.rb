class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :reservations, dependent: :destroy

	# register litings & photos on same form request
	accepts_nested_attributes_for :photos, allow_destroy: true

	validates :house_type, presence: true
	validates :house_years, presence: true
	validates :house_size, presence: true

	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	# validates :address, presence: true
	# validates :listing_title, presence: true
	# validates :listing_content, presence: true
	# validates :price_pernight, presence: true

	extend Enumerize
	enumerize :house_type, in: %w(house mansion apartment other), default: :house
	enumerize :house_size, in: %w(single double triple quadruple), default: :single
	enumerize :active, in: { public: "true" , private: "false"}, default: :private
end
