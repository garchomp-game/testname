class FormRequestController
	def call(env)

		request=Rack::Request.new(env)
		name=request.params["name"]
		@params=request.params()
		Rack:Response.new(render("form_request.html.erb"))
	end
	def render(template)
		path=File.expand_path("../../views/#{template}",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
