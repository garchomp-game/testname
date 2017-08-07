  require 'rack'
require 'mysql2'
require_relative 'database'


class Addall < EcDatabase
  def initialize(params)
    @params=params
    super
  end
  def add(name,item)
    x=@client.prepare(%q{insert into items values(?,?); })
    begin
      x.execute(name,item)
    rescue
      return false
    end
  end
end
