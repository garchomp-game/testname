require 'mysql2'
require 'rack'
require 'rubygems'

class Shop_sqlController

  # | pforileID | name       | tell          | age  | birthday
  def product
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    total=client.query(%q{select * from product; })
    total.each do|i|
      i
    end
  end
  def count
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    total=client.query(%q{select count(*) from product; }).each do|i|
    end
  end

  def call(env)
    request=Rack::Request.new(env)
    @views=product
    @count=count
    Rack::Response.new(render("shop_sql.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

=begin
+------+---------------------+------+--------+-------+
| id   | name                | type | weight | price |
+------+---------------------+------+--------+-------+
|    1 | webテスト完全突破法 | book |    300 |  1500 |
+------+---------------------+------+--------+-------+
1 row in set (0.02 sec)
=end
