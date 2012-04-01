class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # accesses the shopping cart using a session variable
  def current_cart
    if session[:cart_id]
	  @current_cart ||= Cart.find(session[:cart_id])
	else
	  @current_cart = Cart.create!
	  session[:cart_id] = @current_cart.id
	end
	@current_cart
  end
  
end
