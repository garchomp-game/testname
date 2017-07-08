require 'rubygems'
require 'rack'

class SessionGetController
  def call(env)
    request=Rack::Request.new(env)
    request=Rack::Request.new(env)
    @test=request.session["test"]#ここに対応している
    Rack::Response.new(render("session_get.html.erb"))
  end

  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
