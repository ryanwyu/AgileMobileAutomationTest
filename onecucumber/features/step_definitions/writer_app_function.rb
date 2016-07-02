# Uncomment next line if you want oracle connection
#require 'oci8'
# Writer app functional definition
require_relative '../support/app_executor'


  def login_name_input(username)
    $mobile.text_field_input_xpath("//UIATextField[1]", username)
  end

  def login_pswd_input(password)
    $mobile.text_field_input_xpath("//UIATextField[2]", password)
  end

