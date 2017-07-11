require 'mysql2'
require 'rack'
require 'rubygems'

class Sql6_2Controller
  # def sql2(n)
  #   client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')
  #
  #   # puts("DB connected!")
  #   # puts('plase profilesID,name,tell,age,birthday')
  #   # x=gets.chomp.split(',')
  #   # client.(%q{})
  #   # statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)
  #   total=[]
  #   $x=client.prepare(%q{insert into profiles values(v); })
  #   $x.execute("%#{n}%").each do|i|
  #       total.push(i["name"])
  # end

  def call(env)
    request=Rack::Request.new(env)
    @text=request.params
    @sql2=request.params["text1"]
    Rack::Response.new(render("sql6.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
