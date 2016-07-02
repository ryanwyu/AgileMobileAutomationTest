#encoding: utf-8
require 'appium_lib'
#require 'support/app_executor'

假设(/^首次打开作家助手APP$/) do

  $executor.start_app

end

当(/^以用户名"(.*?)"和登录密码(.*?)登录$/) do |username, password|

  $executor.text_input_xpath("//UIATextField[1]", username)
  $executor.text_input_xpath("//UIATextField[2]", password)
  $executor.button_click_xpath("//UIATextField[3]")

end

那么(/^登录"(.*?)"并进入到"(.*?)"页面$/) do |loginstatus, nextpage|
  pending # Write code here that turns the phrase above into concrete actions
end
