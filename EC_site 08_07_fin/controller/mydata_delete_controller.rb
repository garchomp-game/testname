require 'rubygems'
require 'rack'

class MydataDeleteController
  def call(env)
    request=Rack::Request.new(env)
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"]=@secret
    @user=request.session["outputs"]
    Rack::Response.new(render("mydata_delete.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
