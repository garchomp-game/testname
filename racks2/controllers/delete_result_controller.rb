require 'rack'

class DeleteResultController

    def call(env)
      request = Rack::Request.new(env)

      @params = request.params()
      @x=@params["secret"]
      @y=request.session["secret"]
      # insert_confirmページからの遷移でないときはエラーページに飛ばす。正しいときはinsert_resultへ

        # DBに入力パラメータをinsert

        begin
          user_t = UserT.new(@params)

          user_t.delete(@params["id"])

          Rack::Response.new(render("delete_result.html.erb"))
        rescue
          @error = "データベースの接続に失敗しました。"
          Rack::Response.new(render("error.html.erb"))
        end

  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
