class WalletsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def check_receipts
    @receipts = Receipt.where(wallet_id: current_user.wallet.id)
  end

  def change_gift
  end
end
