#encoding: utf-8
require 'appium_lib'
require 'appium_lib'
require 'cucumber/ast'
require 'rubygems'
require 'selenium-webdriver'

#require 'support/app_executor'

假设(/^首次打开作家助手APP$/) do

  $mobile.start_app

end

假设(/^用户选择以"([^"]*)"方式登录$/) do |writer_type|

  # 选择创世登录 "//UIAButton[@name='创世云起作家登录']";
  # 选择起点登录"//UIAButton[@name='起点作家登录']";
  $mobile.tap("//UIAButton[@name="+writer_type+"登录]")

end

当(/^以用户名"(.*?)"和登录密码"(.*?)"登录$/) do |username, password|

  $mobile.text_input_xpath("//UIATextField[@name='']", username)
  $mobile.text_input_xpath("//UIASecureTextField[1]", password)
  $mobile.button_click_xpath("//UIAButton[2]")
end

那么(/^登录"(.*?)"并进入到"(.*?)"页面$/) do |loginstatus, nextpage|
  $mobile.button_click_xpath("//UIAButton[@name='写作']")
  #$mobile.button_click_xpath("//UIAStaticText[@name='创世测试红包02']")
  tap(1, find_element(:xpath, "//UIAStaticText[@name='创世测试红包02']"), 100)
end
