class CarsController < ApplicationController

  LOCATIONS_DEFAULT_LIMIT = 10

  def render_message(message)
    render :json => {message: message}, :status => :bad_request
    true
  end

  def index
  	coord_param = params[:coordinates]
  	render_message("Coordinates param can't be blank on GET") && return unless coord_param
  	coordinates = coord_param.split(/,/)
  	render_message("Coordinates param must be like <lat>,<long> on GET") && return unless coordinates.length==2
  	limit = params[:limit]||LOCATIONS_DEFAULT_LIMIT
  	render :json => Location.geo_near([coordinates[1].to_f,coordinates[0].to_f]).first(limit.to_i)
  end
end
