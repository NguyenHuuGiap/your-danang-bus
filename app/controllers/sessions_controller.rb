class SessionsController < Devise::SessionsController

  def create
    super do
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
