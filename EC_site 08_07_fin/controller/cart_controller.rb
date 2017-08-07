require 'rubygems'
require 'rack'
require '././models/xml.rb'
require 'rexml/document'
class CartController
  def call(env)
    @params={}
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    user_t=UserT.new(@params)
    @addname="add#{@login_check["name"]}"
    @show_item=user_t.search_name(@addnane)
    @show=[]
    @test_xml=[]
    xmlopen=XmlOpen.new
    begin
      @show_item.each do|i|
        @show.push(i["item"])
      end
    rescue
      @test_xml=Fixnum
    end
    sizes=@show.size
    for i in 0..sizes-1 do
      @test_xml.push(xmlopen.xml_set(@show[i]))
    end
    Rack::Response.new(render("cart.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
