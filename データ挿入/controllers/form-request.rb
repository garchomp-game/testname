require 'rubygems'
require 'rack'

class FormRequestController
  def call(env)
    request=Rack::Request.new(env)
    name=request.params["name"]
    @params=request.params()#つまりこのように定義すると呼び出し時に使えるということ.
    Rack::Response.new(render("jikosyoukai.html.erb"))
  end
  def render(template)
    path=File.expand_path("../../views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
