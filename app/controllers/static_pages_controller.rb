class StaticPagesController < ApplicationController
	def index
		@listings = Listing.where(created_at: created_within_a_month).includes(:photos)
	end

	private
		def created_within_a_month
			1.month.ago.beginning_of_day..Time.now
		end
end
