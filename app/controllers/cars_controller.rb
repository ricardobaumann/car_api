class CarsController < ApplicationController
  def index
  	render :json => Location.all
  end
end
