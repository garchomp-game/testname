require 'rack'

class UpdateController
  def call(env)
    request = Rack::Request.new(env)
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"] = @secret
    @id=request.session["params"]
    user_t=UserT.new(@params)
    

    @test = user_t.search_id(@id["userID"])
    @params=request.params()

    @update_params = {}
    if request.session["update_params"].nil?
      @update_params = {"name" => "", "year" => 0, "month" => 0, "day" => 0, "type" => 1, "tell" => "", "comment" => ""}
    else
      @update_params = request.session["update_params"]
    end
    Rack::Response.new(render("update.html.erb"))
  end


  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
