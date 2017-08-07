require 'rubygems'
require 'rack'

class ResistrationCompleteController
  def call(env)
    request=Rack::Request.new(env)
    @params=request.session["params"]
    @login_check=request.session["outputs"]
    user_t=UserT.new(@params)
    user_t.insert
    Rack::Response.new(render("resistration_complete.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
