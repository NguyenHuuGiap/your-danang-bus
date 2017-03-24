class MapController < ApplicationController
  def index
    @latitude = params[:latitude]
    @longitude = params[:longitude]
  end
end
