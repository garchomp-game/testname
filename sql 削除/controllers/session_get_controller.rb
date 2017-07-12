require 'rubygems'
require 'rack'

class SessionGetController
  def call(env)
    request=Rack::Request.new(env)
    @name=request.session["name"]#ここに対応している
    @sex=request.session["sex"]
    @syumi=request.session["syumi"]
    Rack::Response.new(render("session_get.html.erb"))
    #Rack::Response.new(render("hello.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
