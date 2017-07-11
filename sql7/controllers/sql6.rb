require 'rubygems'
require 'rack'
require 'mysql2'

class SqlController
  def sqls(names)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')

    # puts("DB connected!")
    # puts('plase profilesID,name,tell,age,birthday')
    # x=gets.chomp.split(',')
    # client.(%q{})
    # statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)
    total=[]
    $x=client.prepare(%q{select name from profiles where name like ?; })
    $x.execute("%#{names}%").each do|i|
        total.push(i["name"])
    end
    if names=="" || names==" " || names=="　"
      return ""
    else
      total.each do|i|

      end
    end
    #return names.to_s + 'testname'
  end

  def call(env)
    request=Rack::Request.new(env)

    @text=sqls(request.params["text"])

    Rack::Response.new(render("sql6.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end



end
