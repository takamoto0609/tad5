class ItemsController < ApplicationController
  def index
    my_area
    @items = Item.where(status_id: 2)
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

  def show
    @item = Item.find(params[:id])
    @wash_power = WashPower.find(@item.wash_power_id)
    @status = Status.find(@item.status_id)
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.new(item_params)
    if @item.valid?
      Item.find(params[:id]).update(item_params)
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end
  
  def order
    #binding.pry
    item = Item.find_by(id: params[:format])
    if current_user.wallet.point >= item.point
      order = Order.new
      order.item_id = item.id
      order.taker = current_user.id
      order.giver = item.user_id
      order.point = item.point
      order.save
      @order_message = "リクエストを送信しました"
    else
      @order_message = "ポイントが不足しています"
    end
  end

  def check_order
    if user_signed_in?
      @orders = Order.where(taker: current_user.id).order(id: "DESC")
    else
      redirect_to new_user_session_path
    end
  end

  def crash_order
    #binding.pry
    order = Order.find(params[:format])
    order.destroy
    @orders = Order.where(taker: current_user.id).order(id: "DESC")
    redirect_to check_order_items_path
  end

  def receive_order
    if user_signed_in?
      @orders = Order.where(giver: current_user.id).order(id: "DESC")
    else
      redirect_to new_user_session_path
    end
  end

  def approval_order
    #binding.pry
    order = Order.find(params[:format].to_i)
    Order.find(params[:format].to_i).update(status: 1)
    taker_receipt = Receipt.new
    taker_receipt.point = (-1)*order.point
    taker_receipt.wallet_id = User.find_by(id: order.taker).wallet.id
    taker_receipt.reason = "サービスを利用しました"
    taker_receipt.save
    giver_receipt = Receipt.new
    giver_receipt.point = order.point
    giver_receipt.wallet_id = User.find_by(id: order.giver).wallet.id
    giver_receipt.reason = "サービス提供のお礼です"
    giver_receipt.save
    @orders = Order.where(giver: current_user.id).order(id: "DESC")
    redirect_to receive_order_items_path
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
