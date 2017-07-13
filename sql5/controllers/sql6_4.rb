require 'mysql2'
require 'rack'
require 'rubygems'

class Sql6_4Controller
  def update(n)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
    x=client.prepare(%q{update profiles set pforileID=?, name=?, tell=?, age=?, birthday=? where pforileID=?;})
    x.execute(n[0],"#{n[1]}","#{n[2]}",n[3],"#{n[4]}",n[5])
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
    @update=update(request.params.values)
    Rack::Response.new(render("sql6_4.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
