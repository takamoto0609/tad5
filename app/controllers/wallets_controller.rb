class WalletsController < ApplicationController
  def show
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def check_receipts
    @receipts = Receipt.where(wallet_id: current_user.wallet.id)
  end

  def change_gift
  end
end
