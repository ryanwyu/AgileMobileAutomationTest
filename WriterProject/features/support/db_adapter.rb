#encoding: utf-8
require 'mysql'

class DBAdapter
  attr_accessor :db
  def start_db(host, username)
    db = Mysql.connect(host, username, '', 'writer')
  end



end
