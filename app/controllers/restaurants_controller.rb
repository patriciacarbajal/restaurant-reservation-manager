class RestaurantsController < ApplicationController
  before_action :get_restaurant, except: [:create, :index, :new]

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new(restaurant_id: params[:id] )
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "#{@restaurant.name} added!"
      redirect_to restaurants_path
    else
      flash[:alert] = "Error: Please try again"
      render :new
    end
  end

  def update
    @restaurant.update_attributes(restaurant_params)
    if @restaurant.save
      flash[:notice] = "#{@restaurant.name} details updated!"
      redirect_to restaurants_path
    else
      flash[:alert] = "Error: Please try again"
      render :edit
    end
  end
  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :open_time, :closing_time, :address, :capacity, :phone)
  end
end
