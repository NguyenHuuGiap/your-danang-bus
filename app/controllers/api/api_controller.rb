class Api::ApiController < ActionController::Base
  include AccessTokenHelper
  before_action :verify_access_token

  protected

  def render_success_response(data)
    render json: {data: data}
  end

  def render_error_response(error)
    render json: {errors: error}, status: :bad_request
  end
end