require 'rubygems'
require 'rack'


class ItemController
  def call(env)
    request=Rack::Request.new(env)
    @params=request.params()
    @items=@params["kw"]
    @login_check=request.session["outputs"]
    @hogehoge=request.session["outputs"].nil?
    request.session["items"]=@items
    Rack::Response.new(render("item.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
