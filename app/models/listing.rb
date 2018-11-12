class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # register litings & photos on same form request
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :house_type, presence: true
  validates :house_years, presence: true
  validates :house_size, presence: true
  validates :address, presence: true
  validates :listing_title, presence: true
  validates :listing_content, presence: true
  validates :price_pernight, presence: true
  validates :active, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :active, -> { where(active: true) }

  extend Enumerize
  enumerize :house_type, in: %w(house mansion apartment other), default: :house
  enumerize :house_size, in: %w(single double triple quadruple), default: :single
  enumerize :active, in: { public: "true" , private: "false"}, default: :private

  def self.active_listing_near_geolocation(geolocation)
    active.near(geolocation, 1, order: 'distance')
      .includes(:photos)
  end

  def self.set_active_listings_by_geolocation(latitude, longitude)
    active.near([latitude, longitude], 1, order: 'distance')
      .includes(:photos)
  end

  def delete_reserved_listings(start_date, end_date, all_listings)
    if reservations.reserved_listing?(start_date, end_date)
      all_listings.delete(self)
    end
  end
end
