class Api::AccessTokenController < Api::ApiController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      access_token = login user
      render_success_response(access_token: access_token)
    else
      render_error_response t('.invalid_email_password')
    end
  end

  def update

  end

end
