class Api::UsersController < Api::ApiController

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
    
  end

  private

  def register_params
    convert_params params.permit(:user_name, :email, :password)
  end

  def convert_params(params)
    params[:name] = params[:user_name]
    params.except :user_name
  end
end
