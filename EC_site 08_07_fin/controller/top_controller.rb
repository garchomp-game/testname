require 'rubygems'
require 'rack'

class TopController
  def call(env)
    request = Rack::Request.new(env)
    @login_check=request.session["outputs"]
    @error=nil
    Rack::Response.new(render("top.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
