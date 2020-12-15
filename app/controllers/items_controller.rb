class ItemsController < ApplicationController
  def index
    my_area
    @items = Item.all
    gon.items = @items
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    item = Item.new(item_params)
    if item.valid?
      Item.create(item_params)
      redirect_to :root
    else
      @item = Item.new(item_params)
      render :new
    end
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

  def item_params
    params.require(:item).permit(:wash_power_id, :status_id, :point, :comment, :address, :user_id, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
