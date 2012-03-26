class Product < ActiveRecord::Base

  def paypal_encrypted(return_url, notify_url)
    # header info to paypal for every cart
	values = {
	  :business => APP_CONFIG[:paypal_email],
	  :cmd => '_cart',
	  :upload => 1,
	  :return => return_url,
	  :invoice => 1, #shopping cart id
	  :notify_url => notify_url,
	  :cert_if => APP_CONFIG[:paypal_cert_id]
	}
	
	# values for each item in shopping cart
	test_product = Product.find(1)
	values.merge!({
	  "amount_#1" => test_product.price,
	  "item_name_#1" => test_product.name,
	  "item_number_#1" => test_product.id,
	  "quantity_#1" => 3
	})
	
	encrypt_for_paypal(values)
  end

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")
  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM),        OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"),        OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end  
  
end
