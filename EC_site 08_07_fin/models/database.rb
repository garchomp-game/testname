require 'rack'
require 'mysql2'

class EcDatabase
  def initialize(params)
    @client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'ec_db')
    print("DB connected!")
  end
end
