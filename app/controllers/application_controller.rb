class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def products
    Product.all
  end
end
