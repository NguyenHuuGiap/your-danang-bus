module AccessTokenHelper

  def login user
    @current_user = user
    AccessToken.create_or_refresh_token! user
  end

  def verify_access_token
    token = AccessToken.find_by_token(request.authorization)
    @current_user = token.user unless token.nil?
  end

end
