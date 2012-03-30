class Cartitem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def quantity
    cart.carditems.count{|i| i = self}
  end
  
end
