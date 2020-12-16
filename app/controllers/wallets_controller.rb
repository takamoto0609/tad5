class WalletsController < ApplicationController
  def show
  end

  def check_receipts
    @receipts = Receipt.where(wallet_id: current_user.wallet.id)
  end
end
