class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      session[:account_type] = customer.account_type
      redirect_to restaurants_path
    else 
      flash.now[:alert] = "Incorrect login"
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end
end
