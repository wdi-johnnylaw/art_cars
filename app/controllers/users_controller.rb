class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_user_in @user
			redirect_to root_path
		else
			render action: 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end