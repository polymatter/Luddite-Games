class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # accesses the shopping cart using a session variable
  def current_cart
    @current_cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create!
	
	if session[:cart_id] != @current_cart.id
	  session[:cart_id] = @current_cart.id
	end

	@current_cart
  end
  
end
