require 'rubygems'
require 'rack'

class MydataDeleteResultController
  def call(env)
    request=Rack::Request.new(env)
    @secret = request.session["secret"]
    @params=request.params()
    @login_check=request.session["outputs"]
    @addname=@login_check
    if @secret==@params["kw"]
      user_t=UserT.new(@params)
      user_t.mydelete_result(@addname["name"])
      request.session["outputs"]=nil
      @test=true
    else
      @test=false
    end





    request.session["secret"] = Digest::SHA256.hexdigest(rand.to_s)
    @user=request.session["outputs"]
    Rack::Response.new(render("mydata_delete_result.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
