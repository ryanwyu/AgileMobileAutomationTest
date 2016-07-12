# Uncomment next line if you want oracle connection
#require 'oci8'
require 'rspec'
require_relative 'app_executor'

class AndroidAdapter < MobileAdapter
  include RSpec::Matchers

  def start_app
    # Make sure you have started appium server 
    # puts available_contexts
    # set_context("NATIVE_APP")
    # puts $driver.class
  end

  def text_input_xpath(xpath, value)

  end

end
