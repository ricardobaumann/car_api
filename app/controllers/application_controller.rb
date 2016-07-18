class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_format

  def set_format
 	request.format = 'json'
  end

  rescue_from Exception, :with => :error_render_method

  def error_render_method(exception)
    render :json => {message: exception.message}, :status => :internal_server_error
    true
  end
end
