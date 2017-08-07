require 'rubygems'
require 'rack'
require '././models/add_all.rb'

class AddController
  def call(env)
    request=Rack::Request.new(env)
    @items=request.session["items"]
    if request.session["outputs"].nil?
      Rack::Response.new(render("login.html.erb"))
    else
      begin
        @error=true
        @login_check=request.session["outputs"]
        @name=@login_check["name"]
        @addname="add#{@name}"
        @params=request.params()
        adds=Addall.new(@params)
        request.session["add_check"]=adds.add(@addname,@items)==false
        @checks=request.session["add_check"]
      rescue
        @error=false
      end
    end
    Rack::Response.new(render("add.html.erb"))
  end
  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
