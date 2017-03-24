class Api::BusesController < Api::ApiController

  def index
    @data = Bus.available_buses(*location_param)
    render_error_response t('.bus_not_found') if @data.nil?
  end

  def show
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
