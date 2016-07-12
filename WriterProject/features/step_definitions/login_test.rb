#encoding: utf-8
require 'appium_lib'
require 'appium_lib'
require 'cucumber/ast'
require 'rubygems'
require 'selenium-webdriver'

#require 'support/app_executor'

def logout
  $mobile.tap("//UIAButton[@label='我']")
  $mobile.tap("//UIAStaticText[@label='设置']")
  $mobile.tap("//UIAButton[@label='退出登录']")
  $mobile.tap("//UIACollectionCell/UIAButton[@label='退出']")
end

假设(/^首次打开作家助手APP$/) do

  $mobile.start_app

  #如果App打开时处于登录状态, 先执行退出操作
  title = $mobile.get_name("//UIANavigationBar/UIAStaticText[2]")
  if not title.match('登录')
    logout
  end

end

假设(/^用户选择以"([^"]*)"方式登录$/) do |writer_type|

  # 选择创世登录 "//UIAButton[@name='创世云起作家登录']";
  # 选择起点登录"//UIAButton[@name='起点作家登录']";
  type = {
      '创世' => '创世云起作家',
      '起点' => '起点作家'
  }

  #判断首页标题是否和作家类型一致,不一致则切换登录类型
  pagetype = $mobile.get_name("//UIANavigationBar/UIAStaticText[2]")[0,2]
  if  type[pagetype] != writer_type
    $mobile.tap("//UIAButton[@name='切换至"+writer_type+"登录']")
  end

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
