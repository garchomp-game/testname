require 'mysql2'
require 'rack'
require 'rubygems'

class LogincheckController
  def call(env)
    request=Rack::Request.new(env)
    Rack::Response.new(render("shop_login.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
