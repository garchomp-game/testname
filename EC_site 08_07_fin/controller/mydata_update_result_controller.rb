require 'rubygems'
require 'rack'

class MydataUpdateResultController
  def call(env)
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    @params=request.params()
    @name=@params["name"]
    @pass=@params["pass"]
    @mail=@params["mail"]
    @address=@params["address"]
    user_t=UserT.new(@params)
    user_t.update
    @login_data=request.session["login_data"]
    request.session["outputs"]=@params
    Rack::Response.new(render("mydata_update_result.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
