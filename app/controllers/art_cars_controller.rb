class ArtCarsController < ApplicationController
  def index
  	@art_cars = ArtCar.all
  end

  def show
  	@art_car = ArtCar.find(params[:id])
  end

  def create
  	@art_car = ArtCar.new(art_car_params)

  	if @art_car.save
  		flash[:notice] = "Successfully created art car!"
  		redirect_to action: 'index'
  	else
  		render action: 'new'
  	end
  end

  def new
  	@art_car = ArtCar.new
  end

  private

  def art_car_params
  	params.require(:art_car).permit(
  		:name, :hometown, :power_source, :flame_effects, :street_legal, :photo_url
  	)
  end
end
