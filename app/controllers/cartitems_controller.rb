class CartitemsController < ApplicationController

  def create
    product = Product.find(params[:product_id].to_i)
	quantity = params[:quantity].to_i
	quantity ||= 1
	
	cartitem = current_cart.cartitem_for(product)	
	cartitem.add(1)
	  
	redirect_to root_url
  end
end
