#encoding: utf-8
require 'appium_lib'
require 'appium_lib'
require 'cucumber/ast'
require 'rubygems'
require 'selenium-webdriver'

# Writer app functional definition

假设(/^作家"(.*?)"已经保存过一个草稿章节$/) do |writer_id|
  # 需要查询相关数据库检查相关字段
  #db_driver = Yuewen::Database::Table.new
  #$executor.draft_exist? (writer_id)

end

当(/^进入"([^"]*)"的章节列表页面$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions

end

当(/^选择"([^"]*)"进行删除操作$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

那么(/^"([^"]*)"就会在草稿箱章节列表里消失$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

那么(/^在回收站页列表面里出现"([^"]*)"名称项$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

