require 'rubygems'
require 'rack'

class SerchController
  def call(env)
    request=Rack::Request.new(env)
    
    @login_check=request.session["outputs"]
    @params=request.params()
    @serch=@params["serch"]
    request.session["items"]=@params["items"]
    if @serch==""
      @error="検索バーに何か入力してください。"
      Rack::Response.new(render("top.html.erb"))
    else
      Rack::Response.new(render("serch.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
