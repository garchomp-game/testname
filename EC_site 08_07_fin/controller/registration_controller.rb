require 'rubygems'
require 'rack'

class RegistrationController
  def call(env)
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    @name=request.session["regis_name"]
    @pass=request.session["regis_pass"]
    @mail=request.session["regis_mail"]
    @address=request.session["regis_address"]
    @login_check=request.session["outputs"]
    Rack::Response.new(render("registration.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
