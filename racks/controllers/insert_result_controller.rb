require 'rack'
require '././models/user_t.rb'

# 入力パラメータをDBにinsertし、その結果を表示します。
class InsertResultController
  def call(env)

    request = Rack::Request.new(env)
<<<<<<< HEAD
    
    @params=request.params()
    if @params["secrets"]==request.session["secrets"]
      @params = request.session["insert_params"]
      # DBに入力パラメータをinsert
      user_t = UserT.new(@params)
      user_t.insert

      Rack::Response.new(render("insert_result.html.erb"))
    else
      @error = "不正なアクセスルートです"

      Rack::Response.new(render("error.html.erb"))
    end
=======
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"] = @secret
    @params = request.session["insert_params"]

    # DBに入力パラメータをinsert
    user_t = UserT.new(@params)
    user_t.insert

    Rack::Response.new(render("insert_result.html.erb"))
>>>>>>> 24630e851313d0ceae78bf3070bb5ed05e343dec
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
        ERB.new(File.read(path)).result(binding)
  end
end
