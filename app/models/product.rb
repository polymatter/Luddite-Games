class Product < ActiveRecord::Base 
  
  def count_in(cart)
    cart.products.to_a.count {|p| p == self }
  end
  
end
