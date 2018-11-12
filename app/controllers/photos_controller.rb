class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    if @photo.save
      notice: "写真のアップロードが完了しました。"
    else
      notice: "写真のアップロードに失敗しました。"
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
