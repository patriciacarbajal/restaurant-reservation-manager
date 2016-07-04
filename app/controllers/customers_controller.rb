class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
        redirect_to login_path
    else
        render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @reservations = Reservation.where(customer_id: @customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:notice] = "Account updated!"
      redirect_to restaurants_path
    else
      flash[:alert] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    session[:customer_id] = nil
    flash[:notice] = "Account deleted!"
    redirect_to restaurants_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, :phone)
  end

end
