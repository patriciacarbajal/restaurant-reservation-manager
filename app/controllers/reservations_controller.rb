class ReservationsController < ApplicationController
  before_action :load_reservation, only: [:show, :edit, :update, :destroy ]
  before_action :load_restaurant, except: [:create]

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant = @restaurant
    @reservation.customer = current_customer
    if @reservation.save
      flash[:notice] = "Reservation booked!"
      redirect_to customer_path(current_customer.id)
    else
      flash[:alert] = "Error: Please try again"
      redirect_to restaurant_path(@restaurant.id)
    end
  end

  def show
  end

  def edit
  end

  def update
    @reservation.update_attributes(reservation_params)
    if @reservation.save
      flash[:notice] = "Reservation updated!"
      redirect_to customer_path(current_customer.id)
    else
      flash[:alert] = "Error: Please try again"
      render :show
    end
  end

  def destroy
    @reservation.destroy
    flash[:notice] = "Reservation deleted!"
    redirect_to customer_path(current_customer.id)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size, :phone)
  end
  def load_restaurant
    @restaurant = Restaurant.find(@reservation.restaurant_id)
  end
  def load_reservation
    @reservation ||= Reservation.find(params[:id])
  end
  def current_customer
    Customer.find(session[:customer_id])
  end

end
