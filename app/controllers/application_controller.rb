class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ActionController::RoutingError, with: :route_not_found

  private
  def record_not_found
  	render plain: "404\nResource not found"
  end

  def route_not_found
  	render plain: "Sorry can't understand where you want to go\nPlease check the URL"
  end
end
