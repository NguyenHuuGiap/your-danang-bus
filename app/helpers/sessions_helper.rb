module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def get_current_user
    @current_user ||= User.get_current_user(session)
  end

  def log_out
    session.delete(:user_id)
  end

end
