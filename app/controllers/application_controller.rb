class ApplicationController < ActionController::Base
  layout :layout_by_login
  protect_from_forgery with: :exception

  protected

  def layout_by_login
    'application_unlogin'
  end

end
