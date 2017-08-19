class UsersController < ApplicationController
	before_action :correct_user, only: [:show]

	def show
	end

	private
		# before actions
		def correct_user
			@user = User.find_by(id: params[:id])
			if @user != current_user
				redirect_to root_path, alert: "アクセス権限がありません。"
			end
		end
end
