# This file provides setup and common functionality across all features.  It's
# included first before every test run, and the methods provided here can be 
# used in any of the step definitions used in a test.  This is a great place to
# put shared data like the location of your app, the capabilities you want to
# test with, and the setup of selenium.

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'rubygems'
require 'selenium-webdriver'
#require '/Users/yourusername/workspace/MobileAutomation/mobileautomation/AppGap/features/step_definitions/ios_simulator'

MAX_SLEEP_SECS = 30
MAXWAITSECONDS = 30
ORACLE_ADDRESS = '//your.oracle.db.domain.name.com:1521/your-db-name'

$server_url = "http://appium.server.host:4723/wd/hub"

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

# Load the desired configuration from appium.txt, create a driver then
# add the methods to the world

$caps = Appium.load_appium_txt file: File.expand_path("./../"+ENV['IDEVICENAME']+"/appium.txt", __FILE__), verbose: true
$caps[:appium_lib] = {}
$caps[:appium_lib][:server_url] = $server_url

# Cucumber method World()
World do
  AppiumWorld.new
end



Before {

  case
    when $caps[:caps][:platformName] == "ios" || $caps[:caps][:platformName] == "iOS"
      Appium::Driver.new($caps)
      Appium.promote_appium_methods IosAdapter
      $executor = AppExecutor.new(IosAdapter.new).adapter
    when $caps[:caps][:platformName] == "android"
      Appium::Driver.new($caps)
      Appium.promote_appium_methods AndroidAdapter
      $executor = AppExecutor.new(AndroidAdapter.new).adapter
    when $caps[:caps][:platformName] = "dummy"
      $executor = AppExecutor.new(MobileAdapter.new).adapter
  end

  if $caps[:caps][:platformName] != "dummy"
    $driver.start_driver
    $driver.set_wait 60
  end

}

After {
  if $caps[:caps][:platformName] != "dummy"
    $driver.driver_quit
  end

}