class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_register_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
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
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :avatar)
  end

  def user_edit_params
    params.require(:user).permit(:name, :password,
                                 :password_confirmation, :avatar)
  end

end
