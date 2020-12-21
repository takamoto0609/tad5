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
    if gift.gift_id == 1 && current_user.wallet.point >= 5000
      gift.point = 5000
      if gift.valid?
        gift.save
        Gift.create(gift_params)
        receipt = Receipt.new
        receipt.point = -5000
        receipt.wallet_id = current_user.wallet.id
        receipt.reason = "景品と交換"
        receipt.save
        redirect_to :root
      else
        @gift = Gift.new(gift_params)
        render :new
      end
    elsif gift.gift_id == 2 && current_user.wallet.point >= 1000
      gift.point = 1000
      if gift.valid?
        gift.save
        Gift.create(gift_params)
        receipt = Receipt.new
        receipt.point = -1000
        receipt.wallet_id = current_user.wallet.id
        receipt.reason = "景品と交換"
        receipt.save
        redirect_to :root
      else
        @gift = Gift.new(gift_params)
        render :new
      end
    elsif gift.gift_id == 3 && current_user.wallet.point >= 100
      gift.point = 100
      if gift.valid?
        gift.save
        Gift.create(gift_params)
        receipt = Receipt.new
        receipt.point = -100
        receipt.wallet_id = current_user.wallet.id
        receipt.reason = "景品と交換"
        receipt.save
        redirect_to gifts_path
      else
        @gift = Gift.new(gift_params)
        render :new
      end
    else
      @gift = Gift.new(gift_params)
      render :new
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:gift_id, :name, :address, :user_id).merge(user_id: current_user.id)
  end
end
