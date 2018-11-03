class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validates :start_date, presence: true
	validates :end_date, presence: true

	def self.reserved_listing?(start_date, end_date)
		where(
			"(? <= start_date AND start_date <= ?)
			 OR (? <= end_date AND end_date <= ?)
			 OR (start_date < ? AND ? < end_date)",
			start_date, end_date,
			start_date, end_date,
			start_date, end_date
		).present?
	end
end
