# Uncomment next line if you want oracle connection
#require 'oci8'
require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'rubygems'
require 'selenium-webdriver'
require_relative 'app_executor'

class IosAdapter < MobileAdapter
  include RSpec::Matchers

  ################################
  # App Level function
  ################################

  def start_app
    # Make sure you have started appium server
    current_context = "WEBVIEW_1"
  end

  ################################
  # Input Text Field functions
  ################################

  def text_input_xpath(locator, inputvalue)
    $textfield = find_element(:xpath, locator)
    $textfield.clear
    $textfield.send_keys inputvalue
    #find_element(:xpath, locator).send_keys inputvalue
  end

  def input(locator, value)
    textfield = find_element(:xpath, locator)
    textfield.clear
    textfield.send_keys value
  end

  ################################
  # Click Button Function
  ################################

  #Locate the button by xpath and click it
  def button_click_xpath(locator)
    find_element(:xpath, locator).click
  end

  def tap(locator)
    find_element(:xpath, locator).click
  end
  ################################
  # Other testability functions
  ################################

  def get_name(locator)
    find_element(:xpath, locator).name
  end

  def rescue_exceptions
    begin
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      retry
    end
  end

  def uia_window_adapter
    windowPath = "UIAWindow[1]"
    if $caps[:caps][:deviceName] == "iPhone 6" || $caps[:caps][:deviceName] == "iPhone 6 Plus"
      windowPath = "UIAWindow[2]"
    end
    return windowPath
  end

  def wait_until_displayed(locator)
    rescue_exceptions { find_element(:xpath, locator).displayed? }
  end

end
