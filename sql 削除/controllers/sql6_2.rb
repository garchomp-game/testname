require 'mysql2'
require 'rack'
require 'rubygems'

class Sql6_2Controller
  def sql2(n)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')

    # puts("DB connected!")
    # puts('plase profilesID,name,tell,age,birthday')
    # x=gets.chomp.split(',')
    # client.(%q{})
    # statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)
  #total=[]
  1.times do
    if n[0]=="" ||n[1]=="" ||n[2]=="" ||n[3]=="" ||n[4]==""
      break
    else
      $sql2=client.prepare(%q{insert into profiles values(?,?,?,?,?); })
      $sql2.execute(n[0],"#{n[1]}","#{n[2]}",n[3],"#{n[4]}")
    end
  end
    $x=client.query(%q{select * from profiles; }).each do|i|
        i
  end
end



  # | pforileID | name       | tell          | age  | birthday

  def call(env)
    request=Rack::Request.new(env)
    @sql2=sql2(request.params.values)
    Rack::Response.new(render("sql6_2.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
