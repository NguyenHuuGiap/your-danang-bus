class Api::RoutesController < Api::ApiController
  before_action :authenticate_user

  def index
    @data = if params.key?(:starting_point) && params.key?(:starting_point)
              Route.available_route!(*location_param)
            else
              @data = Route.all
            end
  end

  def show
    @data = Route.find(params[:id])
  end

  private

  def location_param
    p = params.permit(:starting_point, :destination)
    starting_point = CGI::parse(p[:starting_point])
    destination = CGI::parse(p[:destination])
    [LatLng.new(starting_point['latitude'][0], starting_point['longitude'][0]),
     LatLng.new(destination['latitude'][0], destination['longitude'][0])]
  end
end
