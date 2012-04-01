class Cart < ActiveRecord::Base
  has_many :cartitems
  has_many :products, :through => :cartitems
  
  attr_accessible :cartitems, :products
  
  def cartitem_for(product)
    cartitem = cartitems.select {|i| i.product == product}.first
	if cartitem.nil?
	  cartitem = Cartitem.new
	  cartitem.product = product
	  cartitem.cart = self
	  cartitem.quantity = 0
	  cartitem.save
	  cartitem.update_attributes({:cart => self, :quantity => 0, :product => product})
	end
	cartitem
  end
  
  def paypal_encrypted(return_url, notify_url)
    # header info to paypal for every cart
	values = {
	  :business => APP_CONFIG[:paypal_email],
	  :cmd => '_cart',
	  :upload => 1,
	  :return => return_url,
	  :notify_url => notify_url,
	  :currency_code => 'GBP',
	  :invoice => id,
	  :cert_id => APP_CONFIG[:paypal_cert_id]
	}
	
	# values for each item in shopping cart
	test_product = Product.find(1)
	values.merge!({
	  "amount_1" => test_product.price,
	  "item_name_1" => test_product.name,
	  "item_number_1" => test_product.id,
	  "quantity_1" => 3
	})
	
	encrypt_for_paypal(values)
  end

  #magic encryption copied from railscasts #143 paypal security
  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem") #paypal public key
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")       #app public key
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")         #app private key
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end 

end
