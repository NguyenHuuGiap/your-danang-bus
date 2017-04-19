module AccessTokenHelper

  def login user
    @current_user = user
    AccessToken.create_or_refresh_token! user
  end

  def verify_access_token
    token = request.authorization ? AccessToken.find_by_token(request.authorization.split(' ')[1]) : nil
    @current_user = token.user unless token.nil?
  end

  def current_user_data
    @current_user ||= verify_access_token
  end

end
