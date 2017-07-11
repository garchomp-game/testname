require 'rubygems'
require 'rack'

class NextPageController
	def call(env)
		Rack::Response.new(render("next_page.html.erb"))
	end

	def render(tenplate)
		path=File.expand_path("../../views/#{tenplate}",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end