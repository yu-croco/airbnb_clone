class BankAccountsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_listing, only: [ :index ]
	before_action :is_own_listing?, only: [ :update, :edit, :destroy ]

	def index
		@user = current_user
		session[:listing_id] = @listing.id
	end

	def new
	end

	def create
	end

	def destroy
	end

	private
		def set_listing
			@listing = current_user.listings.find_by(params[:listing_id])
		end

		def is_own_listing?
			unless current_user.listings.include?(@listing)
				redirect_to root_path, alert: "リスティング情報は見つかりませんでした。"
			end
		end

end