class AreasController < ApplicationController
  def new
    if user_signed_in?
      @area = Area.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    area = Area.new(area_params)
    if area.valid?
      if Area.find_by(user_id: current_user.id) != nil
        Area.find_by(user_id: current_user.id).destroy
      end
      Area.create(area_params)
      redirect_to :root
    else
      @area = Area.new(area_params)
      render :new
    end
  end

  private

  def area_params
    params.require(:area).permit(:address, :user_id, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
