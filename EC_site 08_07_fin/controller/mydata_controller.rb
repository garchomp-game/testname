require 'rubygems'
require 'rack'
require '././models/xml.rb'
require 'rexml/document'
class MydataController
  def call(env)
    request=Rack::Request.new(env)
    @login_check=request.session["outputs"]
    @params={}
    user_t=UserT.new(@params)
    @users=user_t.search_user(@login_check["namex"])
    @users.each do|i|
      @user=i
    end
    @count=0
    @test_xml.each do|i|
      @count=@count+i[1].to_i
    end
    @id=@login_check["id"]

    user_t.update_count(@count,@id)

    @name=@user["name"]
    @pass=@user["password"]
    @mail=@user["mail"]
    @address=@user["address"]
    @date=@user["newDate"].to_s
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

    @year=@date.slice(0,4)
    @month=@date.slice(5,2)
    @day=@date.slice(8,2)
    @houls=@date.slice(11,2)
    @min=@date.slice(14,2)
    @sec=@date.slice(17,2)
    Rack::Response.new(render("mydata.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
