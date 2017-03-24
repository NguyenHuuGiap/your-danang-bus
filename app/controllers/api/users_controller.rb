class Api::UsersController < Api::ApiController
  before_action :authenticate_user, only: [:update_profile]

  def register
    user = User.new(register_params)
    if user.save
      access_token = login user
      render_success_response access_token
    else
      render_error_response t('.register_fail')
    end

  end

  def update_profile
    current_user.update(name: update_profile_params[:name])
    if current_user.save
      render_success_response
    else
      render_error_response current_user.errors.messages
    end
  end

  private

  def register_params
    convert_params params.permit(:user_name, :email, :password)
  end

  def update_profile_params
    convert_params params.permit(:user_name)
  end

  def convert_params(params)
    params[:name] = params[:user_name]
    params.except :user_name
  end
end
