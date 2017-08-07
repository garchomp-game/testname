require './controller/top_controller.rb'
require './controller/add_controller.rb'
require './controller/buy_complete_controller.rb'
require './controller/buy_confirm_controller.rb'
require './controller/cart_controller.rb'
require './controller/item_controller.rb'
require './controller/mydata_controller.rb'
require './controller/myhistory_controller.rb'
require './controller/mydata_update_controller.rb'
require './controller/mydata_delete_controller.rb'
require './controller/registration_confirm_controller.rb'
require './controller/registration_controller.rb'
require './controller/resistration_complete_controller.rb'
require './controller/serch_controller.rb'
require './controller/login_controller.rb'
require './controller/login_check.rb'
require './controller/delete.controller.rb'
require './controller/mydata_delete_result_controller.rb'
require './controller/mydata_update_result_controller.rb'

use Rack::Reloader, 0
use Rack::Static, :urls => ["/css","/models "], :root => "."
use Rack::Session::Cookie,
secret: Digest::SHA256.hexdigest(rand.to_s)
Encoding.default_external = 'UTF-8'

map "/login_check" do
  run LoginCheckController.new
end
map "/" do
  run TopController.new
end
map "/add" do
  run AddController.new
end
map "/buy_complete" do
  run BuyCompleteController.new
end
map "/buy_confirm" do
  run BuyConfirmController.new
end
map "/cart" do
  run CartController.new
end
map "/item" do
  run ItemController.new
end
map "/mydata" do
  run MydataController.new
end
map "/mydata_update" do
  run MydataUpdateController.new
end
map "/mydata_delete" do
  run MydataDeleteController.new
end
map "/mydata_delete_result" do
  run MydataDeleteResultController.new
end
map "/mydata_update_result" do
  run MydataUpdateResultController.new
end
map "/myhistory" do
  run MyhistoryController.new
end
map "/registration_confirm" do
  run RegistrationConfirmController.new
end
map "/registration" do
  run RegistrationController.new
end
map "/resistration_complete" do
  run ResistrationCompleteController.new
end
map "/serch" do
  run SerchController.new
end
map "/login" do
  run LoginController.new
end
map "/delete" do
  run DeleteController.new
end
