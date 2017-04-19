class UsersController < Devise::RegistrationsController
  before_action :user_register_params, if: :devise_controller?

  def create
    super do
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = @current_user.clone
  end

  def update
    @current_user.assign_attributes user_edit_params
    if @current_user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_register_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def user_edit_params
    params.require(:user).permit(:name, :password,
                                 :password_confirmation, :avatar)
  end

end
