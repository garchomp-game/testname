require 'rubygems'
require 'rack'

class SessionInstanceController
  def call(env)
    request=Rack::Request.new(env)
    request.session["test"]=Time.new.strftime("%Y年%m月%d日%H時%M分%S秒")
    Rack::Response.new(render("session_instance.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
