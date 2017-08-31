class GuestReservationsController < ApplicationController
	def index
		@listings = current_user.listings.includes(:reservations)
	end
end
