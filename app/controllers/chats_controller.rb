class ChatsController < ApplicationController
  before_action :authenticate_user!

  def new
    @chat = Chat.new
    @item = Item.find_by(id: params[:item_id])
    @chats = Chat.where(item_id: params[:item_id])
  end

  def create
    if Chat.new(chat_params).valid?
      Chat.create(chat_params)
      redirect_to new_item_chat_path(params[:item_id])
    else
      redirect_to new_item_chat_path(params[:item_id])
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end
end
