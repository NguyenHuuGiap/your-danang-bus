class UserLocationController < ApplicationController

  def create
    if logged_in?
      location = current_user.user_location || current_user.build_user_location
      location.assign_attributes location_params
      location.save
    end
  end

  private

  def location_params
    params.require(:user_location).permit(:latitude, :longitude)
  end
end
