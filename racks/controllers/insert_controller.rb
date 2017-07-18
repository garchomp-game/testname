require 'rack'

#入力画面をコントロール。暗号を用意しておき、以降のページに直アクセスできないように
class InsertController
  def call(env)
    request = Rack::Request.new(env)
<<<<<<< HEAD
    @params=request.params()
    #暗号を作成し、セッションに。この暗号をパラメータとして持ったPOSTじゃないと処理を受け付けないように
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"] = @secret
=======

    #暗号を作成し、セッションに。この暗号をパラメータとして持ったPOSTじゃないと処理を受け付けないように
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"] = @secret

>>>>>>> 24630e851313d0ceae78bf3070bb5ed05e343dec
    Rack::Response.new(render("insert.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
