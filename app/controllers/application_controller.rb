class ApplicationController < ActionController::Base
  before_action :get_wallet
  before_action :point_calculation

  private

  def get_wallet
    if user_signed_in?
      if Wallet.find_by(user_id: current_user.id) == nil
        new_wallet = Wallet.new
        new_wallet.user_id = current_user.id
        new_wallet.point = 0
        new_wallet.save
        first_receipt = Receipt.new
        first_receipt.point = 500
        first_receipt.wallet_id = current_user.wallet.id
        first_receipt.reason = "初回お試しポイント"
        first_receipt.save
      end
      @my_wallet = Wallet.find_by(user_id: current_user.id)
    else
    end
  end

  def point_calculation
    if user_signed_in?
      receipts = Receipt.where(wallet_id: current_user.wallet.id)
      point = 0
      receipts.each do |r|
        point = point + r.point
      end
      @my_wallet.point = point
      @my_wallet.save
    end
  end
end
