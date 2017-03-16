class ApplicationController < ActionController::Base
  layout :layout_by_login
  protect_from_forgery with: :exception
  include SessionsHelper

  protected

  def layout_by_login
    if User.find_by(id: session[:user_id])
      'application'
    else
      'application_unlogin'
    end
  end

end
