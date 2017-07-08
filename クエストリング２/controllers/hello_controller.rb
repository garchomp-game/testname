require 'rubygems'
require 'rack'

class HelloController
	def call(env)
		Rack::Response.new(render("hello.html.erb"))
	end

	def render(tenplate)
		path=File.expand_path("../../views/#{tenplate}",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
