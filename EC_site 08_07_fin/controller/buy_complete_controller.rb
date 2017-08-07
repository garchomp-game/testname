require 'rubygems'
require 'rack'

class BuyCompleteController
  def call(env)
    request=Rack::Request.new(env)
    @show=request.session["show_item"]
    @params={}
    user_t=UserT.new(@params)
    @login_check=request.session["outputs"]
    @addname="add#{@login_check["name"]}"
    @show.each do|i|
      user_t.complete_insert(@addname,i)
    end
    @total=request.session["total_price"]
    @names=@login_check["name"]
    user_t.delete_cart
    user_t.insert_price(@total,@names)
    Rack::Response.new(render("buy_complete.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
