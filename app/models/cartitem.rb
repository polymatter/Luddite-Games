class Cartitem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  validates :quantity, :numericality => true, :on => :save
  
  after_initialize :init_quantity
  
  attr_accessible :quantity, :cart, :product, :been_added
  
  def init_quantity
    @quantity = 0
	#self.update_attributes({:quantity => 0 })
  end
  
  def add(more)
    @been_added ||= true
	self.update_attributes({:quantity => self.quantity.to_i + more.to_i })
  end
  
  def been_added
    @been_added
  end
  
end