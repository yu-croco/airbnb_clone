class ListingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_listing, only: [:update, :basics, :description,
			:address, :price, :photos, :calendar, :bankaccount, :publish]

	def index
	end

	def show
	end

	def new
		@listing = current_user.listings.build
	end

	def create
		@listing = current_user.listings.build(listing_params)
		if @listing.save
			redirect_to manage_listing_basics_path(@listing),
				notice: "リスティングの作成・保存が完了しました。"
		else
			redirect_to new_listing_path(@listings),
				notice: "リスティングの作成・保存に失敗しました。"
		end
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to :back, notice: '更新が完了しました。'
		end
	end

	def basics
	end

	def description
	end

	def address
	end

	def price
	end

	def photos
		@photo = Photo.new
	end

	def calendar
	end

	def bankaccount
	end

def publish
end

	private
		def listing_params
			params.require(:listing).permit(:house_type, :house_years, :house_size,
											:price_pernight)
		end

		def set_listing
			@listing = Listing.find_by(params[:id])
		end
end
