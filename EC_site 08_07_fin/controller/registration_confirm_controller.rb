require 'rubygems'
require 'rack'

class RegistrationConfirmController
  def call(env)
    request=Rack::Request.new(env)
    @params=request.params()
    request.session["params"]=@params
    request.session["regis_name"]=@params["name"]
    request.session["regis_pass"]=@params["pass"]
    request.session["regis_mail"]=@params["mail"]
    request.session["regis_address"]=@params["address"]
    @name=request.session["regis_name"]
    @pass=request.session["regis_pass"]
    @mail=request.session["regis_mail"]
    @address=request.session["regis_address"]
    @login_check=request.session["outputs"]
    if @name==""||@pass==""||@mail==""||@address==""
      @niltotal=[]
      if @name==""
        @niltotal.push("ユーザー名が未入力です")
      end
      if @pass==""
        @niltotal.push("パスワードが未入力です")
      end
      if @mail==""
        @niltotal.push("メールアドレスが未入力です")
      end
      if @address==""
        @niltotal.push("住所が未入力です")
      end
      Rack::Response.new(render("registration.html.erb"))
    else
      Rack::Response.new(render("registration_confirm.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
