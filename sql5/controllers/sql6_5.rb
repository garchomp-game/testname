require 'mysql2'
require 'rack'
require 'rubygems'

class Sql6_5Controller
  def sarchs(n)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    x=client.prepare(%q{select * from profiles where name=? or age=? or birthday=?;})
    x.execute("#{n[0]}",n[1],"#{n[2]}").each do|i|
      i
    end
    # x.execute()
  end
  def all
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    client.query(%q{select * from profiles; }).each do|i|
        i
    end
  end

  # | pforileID | name       | tell          | age  | birthday

  def call(env)
    request=Rack::Request.new(env)
    @all=all
    @sarchs=sarchs(request.params.values)
    Rack::Response.new(render("sql6_5.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
