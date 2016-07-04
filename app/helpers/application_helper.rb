module ApplicationHelper
  def current_user
    @current_user ||= Customer.find_by(id: session[:customer_id])
  end
end
