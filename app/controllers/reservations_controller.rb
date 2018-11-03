class ReservationsController < ApplicationController
	before_action :set_listing, only: [:new, :create]
	before_action :authenticate_user!

	def index
		@reservations = current_user.reservations.includes(:listing)
	end

	def new
		@user = current_user
		@start_date = params[:reservation][:start_date].to_date
		@end_date = params[:reservation][:end_date].to_date
		@total_price = @listing.price_pernight * (@end_date - @start_date).to_i
	end

	def create
		user = @listing.user
		amount = params[:reservation][:total_price].to_i

		begin
			charge_reservation(amount, params[:token], user.currency, user.stripe_user_id)
      @reservation = current_user.reservations.create(reservation_params)
      redirect_to @reservation.listing, notice: "予約が完了しました。"
    rescue Stripe::CardError => e
			error = e.json_body[:error][:message]
			flash[:error] = "Charge failed! #{error}"
		end
	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :listing_id, :total_price)
		end

		def set_listing
			@listing = Listing.find(params[:listing_id])
		end

		# Calculate the fee amount that goes to the application.
		# docs https://stripe.com/docs/connect/direct-charges
		def charge_reservation (amount_fee, token, currency_type, stripe_user_id)
			charge = Stripe::Charge.create({
				amount: amount_fee,
				source: token,
				currency: currency_type
			},
				stripe_account: stripe_user_id
			)
		end
end
