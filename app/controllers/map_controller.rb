class MapController < ApplicationController
  layout :layout_angular

  protected

  def layout_angular
      'angular_application'
  end
  def index
    @latitude = params[:latitude]
    @longitude = params[:longitude]
  end
end
