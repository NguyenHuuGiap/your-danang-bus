class HomeController < ApplicationController
  before_action :get_current_user, only: [:index]

  def index
  end

end
