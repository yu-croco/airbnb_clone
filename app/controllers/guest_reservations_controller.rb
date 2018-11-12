class GuestReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings.includes(:reservations)
  end
end
