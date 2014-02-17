class AuthsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.where(username: params[:user][:username]).first
		if user && user.authenticates_with_password?(params[:user][:password])
			log_user_in(user)
			flash[:notice] = "Welcome, #{current_user.username}!"
			redirect_to art_cars_path
		end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to art_cars_path
	end
end