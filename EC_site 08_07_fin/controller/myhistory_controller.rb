require 'rubygems'
require 'rack'
require '././models/xml.rb'
require 'rexml/document'
class MyhistoryController
  def call(env)
    @params={}
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    user_t=UserT.new(@params)
    @item=user_t.search_complete
    @items=[]
    xmlopen=XmlOpen.new
    @item.each do|i|
      @items.push(i["item"])
    end
    @test_xml=[]
    sizes=@items.size
    @items.each do|i|
      @test_xml.push(xmlopen.xml_set(i))
    end
    Rack::Response.new(render("myhistory.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
