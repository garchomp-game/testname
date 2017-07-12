#config.ru
require './controllers/hello_controller.rb'
require './controllers/next_page_controller.rb'
require './controllers/test.rb'
require './controllers/form-request.rb'
require './controllers/session_instance_controller.rb'
require './controllers/session_get_controller.rb'
require './controllers/sql6.rb'
require './controllers/ifelse.rb'
require './controllers/sql6_2.rb'
require './controllers/rentai.rb'
use Rack::Reloader,0
Encoding.default_external='UTF-8'
use Rack::Session::Cookie,
secret: Digest::SHA256.hexdigest(rand.to_s)
map "/" do
	run HelloController.new
end

map "/next_page" do
	run NextPageController.new
end
map "/test" do
	run FormPageController.new
end
map "/form-request" do
	run FormRequestController.new
end
map "/session_instance" do
	run SessionInstanceController.new
end
map "/session_get" do
	run SessionGetController.new
end
map "/sql6" do
	run SqlController.new
end
map "/ifelse" do
	run IfelseController.new
end
map "/sql62" do
	run Sql6_2Controller.new
end
