require 'rack'


# 登録情報の確認を行う。入力が不足しているときは前のページに戻る
class UpdateConfirmController
  def call(env)
    request = Rack::Request.new(env)
    @params=request.params()

    # insertページからの遷移でないときはエラーページに飛ばす。正しいときはinsert_confirmへ
    if @params["secret"] == request.session["secret"]
      @secret = @params["secret"]

      # 入力パラメータをセッションに格納
      request.session["update_params"] = @params
      begin
        user_t = UserT.new(@params)

        # 入力パラメータが不完全かどうかを判別し、状態だけを返却
        @filled_flag = user_t.check_params?

        # 入力パラメータを画面表示用に変換して返却
        @view_params = {}
        if @filled_flag
          @view_params = user_t.view_helper
        end

        Rack::Response.new(render("update_confirm.html.erb"))
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
