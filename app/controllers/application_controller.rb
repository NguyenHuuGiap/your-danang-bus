class ApplicationController < ActionController::Base
  layout :layout_by_login
  protect_from_forgery with: :exception

  include SessionsHelper

  protected

  def layout_by_login
    if user_signed_in?
      'application'
    else
      'application_unlogin'
    end
  end

  private

  def require_login
    return if logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

end
