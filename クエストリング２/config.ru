#config.ru
require './controllers/hello_controller.rb'
require './controllers/next_page_controller.rb'
require './controllers/test.rb'
require './controllers/form-request.rb'
use Rack::Reloader,0
Encoding.default_external='UTF-8'
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
