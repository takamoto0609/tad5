class ItemsController < ApplicationController
  def index
    my_area
  end

  private

  def my_area
    if user_signed_in? && Area.find_by(user_id: current_user.id) != nil
      gon.lat = Area.find_by(user_id: current_user.id).latitude
      gon.lng = Area.find_by(user_id: current_user.id).longitude
    else
      gon.lat = nil
      gon.lng = nil
    end
  end
end
