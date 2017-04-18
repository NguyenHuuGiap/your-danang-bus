class Api::ApiController < ActionController::Base
  include AccessTokenHelper
  include ActionController::Helpers

  protected

  def render_success_response(data = {})
    render json: {data: data}
  end

  def render_error_response(error)
    render json: {errors: error}, status: :bad_request
  end

  protected

  def authenticate_user
    render_error_response I18n.t('api.unauth') if verify_access_token.nil?
  end
end