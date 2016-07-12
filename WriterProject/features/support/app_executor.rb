require 'rspec'
#require_relative '../../features/step_definitions/model/yuewen_database'

# Database Adapter
module DataAdapter

  def draft_exist?(writer_id)

  end

end

class AppExecutor
  include DataAdapter

  attr_accessor :mobile_adapter

  def initialize(mobile_adapter)
    @mobile_adapter = mobile_adapter
  end


end

# Super class or interface of AndroidSimulator and IosSimulator
class MobileAdapter

  def initialize

  end

  def start_app
    # Make sure you have started appium server
    current_context = "WEBVIEW_1"
  end

  ################################
  # Input Text Field functions
  ################################

  def text_input_xpath(locator, inputvalue)
  end

  def input(locator, value)

  end
  ################################
  # Click Button Function
  ################################

  #Locate the button by xpath and click it
  def button_click_xpath(locator)
  end

  def click_location()

  end

  def tap(locator)

  end
  ################################
  # Other testability functions
  ################################

  def get_location(locator)

  end



  def rescue_exceptions
    begin
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retry
    end
  end

  def uia_window_adapter
  end

  def wait_until_displayed(locator)
    rescue_exceptions { find_element(:xpath, locator).displayed? }
  end

end

# Disable the 'expect' sytax
# Use 'should' sytax to evaluate the test result
# For example: actualValue.should eq(expectedValue) 
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable the `expect` sytax...
    c.syntax = :should
  end
end

class WaitUntilDisplayed

  def rescue_exceptions
    begin
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retry
    end
  end

  def wait_until_displayed(locator)
    rescue_exceptions { find_element(:xpath, locator).displayed? }
  end
end