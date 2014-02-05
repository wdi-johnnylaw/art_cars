class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		User.create(params.require(:user).permit(:username, :password))
		redirect_to root_path
	end
end