require 'rubygems'
require 'rack'

class LoginController


  def call(env)
    request = Rack::Request.new(env)
    request.session["back_page"]=@back_page
    @params=request.params()
    request.session["regis_name"]=nil
    request.session["regis_pass"]=nil
    request.session["regis_mail"]=nil
    request.session["regis_address"]=nil
    request.session["backs"]=request.referer
    if @params["login"]=="on_login"
      @checks=1
      Rack::Response.new(render("login.html.erb"))
    elsif @params["login"]=="off_login"
      @checks=3
      request.session["outputs"]=nil
      Rack::Response.new(render("login.html.erb"))
    else
      Rack::Response.new(render("top.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
