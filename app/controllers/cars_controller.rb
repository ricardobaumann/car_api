class CarsController < ApplicationController

  LOCATIONS_DEFAULT_LIMIT = 10

  def index
  	coordinates = params[:coordinates].split(/,/)
  	limit = params[:limit]||LOCATIONS_DEFAULT_LIMIT
  	render :json => Location.geo_near([coordinates[1].to_f,coordinates[0].to_f]).first(limit.to_i)
  end
end
