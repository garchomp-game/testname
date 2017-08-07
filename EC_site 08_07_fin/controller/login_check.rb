require 'rubygems'
require 'rack'
require '././models/user_t.rb'

class LoginCheckController
# http://localhost:9292/item
  def call(env)
    request = Rack::Request.new(env)
      @params=request.params()
      user_t=UserT.new(@params)
      @test="hoge"
      @login=user_t.login
      @login.each do|i|
        @test=i
      end
      request.session["login_data"]=@test
      if @test=="hoge"
        @checks=1
        @error="メールアドレスかパスワードが間違っています。"
        Rack::Response.new(render("login.html.erb"))
      else
        @checks=2
        @backs=request.session["backs"]
        if @backs=="http://localhost:9292/item"
          request.session["outputs"]=@test
          Rack::Respons.new(render("add.html.erb"))
        else
          request.session["outputs"]=@test
          Rack::Response.new(render("login.html.erb"))
        end
        Rack::Response.new(render("login.html.erb"))
      end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
