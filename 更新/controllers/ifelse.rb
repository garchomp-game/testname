require 'rubygems'
require 'rack'

class IfelseController
	def call(env)
		Rack::Response.new(render("sql62.html.erb"))
	end

	def render(tenplate)
		path=File.expand_path("../../views/#{tenplate}",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
