require 'mysql2'
require 'rack'
require 'rubygems'

class LoginController
  def login(n)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    x=client.query(%q{select * from users where pass=name; })

  # | pforileID | name       | tell          | age  | birthday

  def call(env)
    request=Rack::Request.new(env)
    if true
      Rack::Response.new(render("shop_sql.html.erb"))
    else
      Rack::Response.new(render("shop_login.html.erb"))
    end
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
