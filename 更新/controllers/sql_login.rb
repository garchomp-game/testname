require 'mysql2'
require 'rack'
require 'rubygems'

class LoginController
  def login(n)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    x=client.prepare(%q{select * from users where (name=?) and (pass=?); })
    check=x.execute("#{n[0]}","#{n[1]}")
    check.each do|i|
      if i["id"].class==Array
        return false
      else
        return true
      end
    end

  # | pforileID | name       | tell          | age  | birthday
    #total=client.query(%q{})
  end
  def call(env)
    request=Rack::Request.new(env)
    @check=login(request.params.values)
    Rack::Response.new(render("shop_login.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
