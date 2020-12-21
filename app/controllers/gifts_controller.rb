class GiftsController < ApplicationController
  def new
    if user_signed_in?
      @gift = Gift.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    gift= Gift.new(gift_params)
    if item.valid?
      Gift.create(gift_params)
      redirect_to :root
    else
      @gift = Gift.new(gift_params)
      render :new
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:wash_power_id, :status_id, :point, :address, :user_id).merge(user_id: current_user.id)
  end
end
