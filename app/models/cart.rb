class Cart < ActiveRecord::Base
  has_many :cartitems
  has_many :products, :through => :cartitems

  def paypal_encrypted(return_url, notify_url)
    # header info to paypal for every cart
	values = {
	  :business => APP_CONFIG[:paypal_email],
	  :cmd => '_cart',
	  :upload => 1,
	  :return => return_url,
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

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end 

end
