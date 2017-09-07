class PhotosController < ApplicationController

	def new
		@photo = Photo.new
	end

	def create
		if @photo.save
			render json: { message: "success", photoId: @photo.id },
				status: 200
		else
			render json: { error: @photo.errors.full_messages.join(", ") },
				status: 400
		end
	end

	def destroy
		@photo = current_user.listings.photo(id: params[:id])
		if @photo.destroy
			render json: { message: "file deleted." }
		else
			render json: { message: @photo.errors.full_messages.join(", ") }
		end
	end

	private

		def photo_params
			params.require(:photo).permit(:image, :listing_id)
		end

end
