require 'rack'

class UpdateResultController

    def call(env)

      request = Rack::Request.new(env)
      
      params = request.params()

      # insert_confirmページからの遷移でないときはエラーページに飛ばす。正しいときはinsert_resultへ
      if params["secret"] == request.session["secret"]

        # DBに入力パラメータをinsert

        begin
          user_t = UserT.new(request.session["update_params"])
          user_t.update
          @view_params = user_t.view_helper
          Rack::Response.new(render("update_result.html.erb"))
        rescue
          @error = "データベースの接続に失敗しました。"
          Rack::Response.new(render("error.html.erb"))
        end

      else
        @error = "不正なアクセスルートです"

        Rack::Response.new(render("error.html.erb"))
      end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
