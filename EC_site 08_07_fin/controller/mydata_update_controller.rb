  require 'rubygems'
require 'rack'

class MydataUpdateController
  def call(env)
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    @name=@login_check["name"]
    @pass=@login_check["password"]
    @mail=@login_check["mail"]
    @address=@login_check["address"]
    Rack::Response.new(render("mydata_update.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
