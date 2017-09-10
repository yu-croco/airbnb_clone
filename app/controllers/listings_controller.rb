class ListingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_listing, only: [:update, :edit, :destroy]
	before_action :is_own_listing?, only: [:update, :edit, :destroy]
	before_action :check_listing_existence, only: [:index, :show]

	def index
		@listings = current_user.listings.includes(:photos)
	end

	def show
		@listing = Listing.find_by(params[:listing_id])
		@photos = @listing.photos
	end

	def new
		@listing = current_user.listings.new
	end

	def create
		@listing = current_user.listings.build(listing_params)
		if @listing.save
			redirect_to listings_path,
				notice: "リスティングの作成・保存が完了しました。"
		else
			redirect_to new_listing_path(@listings),
				alert: "リスティングの作成・保存に失敗しました。"
		end
	end

	def edit
		@photo = @listing.photos.where(listing_id: params[:listing_id])
	end

	def update
		if @listing.update_attributes(listing_params)
			redirect_to listings_path, notice: '更新が完了しました。'
		else
			render rdit_listing_path(@listings),
				alert: "リスティングの編集に失敗しました。"
		end
	end

	def destroy
		@listing.destroy
		redirect_to listings_path,
			notice: 'リスティングを削除しました。'
	end

	private
		def listing_params
			params.require(:listing).permit(:house_type, :house_years,
					:house_size, :price_pernight, :address, :listing_title,
					:listing_content, :active, photos_attributes: [:image, :listing_id])
		end

		def set_listing
			@listing = current_user.listings.find_by(params[:listing_id])
		end

		def is_own_listing?
			listing = Listing.find_by(params[:id])
			unless current_user.listings.include?(listing)
				redirect_to root_path, alert: "閲覧権限がありません。"
			end
		end

		def check_listing_existence
			@listing = Listing.find_by(id: params[:id])
			if @listing.nil?
				redirect_to root_path, alert: "リスティング情報は見つかりませんでした。"
			end
		end
end
