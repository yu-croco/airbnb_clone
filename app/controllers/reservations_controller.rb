class ReservationsController < ApplicationController

	def index
		@reservations = current_user.reservations
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			redirect_to @reservation.listing, notice: "予約が完了しました。"
		else
			redirect_to @reservation.listing, alert: "予約に失敗しました。もう一度予約してください。"
		end
	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :listing_id)
		end
end
