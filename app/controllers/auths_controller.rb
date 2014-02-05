class AuthsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.find_by(username: params[:user][:username])
		if user.authenticates_with_password?(params[:user][:password])
			session[:user_id] = user.user_id
			redirect_to art_cars_path
		end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to art_cars_path
	end
end