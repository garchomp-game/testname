require 'rubygems'
require 'rack'

class BuyConfirmController
  def call(env)
    request=Rack::Request.new(env)
    @params=request.params()
    @login_check=request.session["outputs"]
    user_t=UserT.new(@params)
    @addname="add#{@login_check["name"]}"
    @show_item=user_t.search_name(@addnane)
    @show=[]
    @test_xml=[]
    xmlopen=XmlOpen.new
    @show_item.each do|i|
      @show.push(i["item"])
    end
    @total=@params["kw"]
    request.session["total_price"]=@total
    request.session["show_item"]=@show
    sizes=@show.size
    for i in 0..sizes-1 do
      @test_xml.push(xmlopen.xml_set(@show[i]))
    end
    @login_check=request.session["outputs"]
    Rack::Response.new(render("buy_confirm.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
