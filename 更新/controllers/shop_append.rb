require 'mysql2'
require 'rack'
require 'rubygems'

class ShopAppendController
  def login(n)
    1.times do
      if n[0].nil?||n[1].nil?||n[2].nil?||n[3].nil?||n[4].nil?
        break
      elsif n[0]==""||n[1]==""||n[2]==""||n[3]==""||n[4]==""
        break
      else
      client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
      x=client.prepare(%q{insert into product values(?,?,?,?,?); })
      total=x.execute(n[0],"#{n[1]}","#{n[2]}",n[3],n[4])
      end
    end
  # | pforileID | name       | tell          | age  | birthday
  end
  def call(env)
    request=Rack::Request.new(env)
    login(request.params.values)
    Rack::Response.new(render("shop_append.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
