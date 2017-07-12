require 'rubygems'
require 'rack'
require 'mysql2'

class Sql6_3Controller

  def all
    total=[]
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    client.query(%q{select * from profiles;}).each do|i|
      total.push(i)
    end

    return total
  end
  def delete(n)
    total=[]
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    if !(n.to_i.zero?)
      x=client.prepare(%q{delete from profiles where pforileID=?; })
      x.execute(n)
    else
      return "error!"
    end
  end
  def call(env)
    request=Rack::Request.new(env)
    @delete=delete(request.params["id"])
    @all=all
    #@delete=delete
    Rack::Response.new(render("sql6_3.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end



end
