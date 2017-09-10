class UsersController < ApplicationController

	def show
		@user = User.find_by(id: params[:id])
		if @user.nil?
			redirect_to root_path, alert: "ユーザ情報は見つかりませんでした。"
		end
	end

end
