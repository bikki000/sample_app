class ErrorsController < ApplicationController
	def not_found
		render plain: "404\nResource Not Found", status: 404
	end

	def internal_server_error
		render plain: "internal_server_error", status: 500
	end
end
