class ApplicationController < ActionController::Base
  before_action :get_wallet

  private

  def get_wallet
    if user_signed_in?
      if Wallet.find_by(user_id: current_user.id) == nil
        new_wallet = Wallet.new
        new_wallet.user_id = current_user.id
        new_wallet.point = 0
        new_wallet.save
      end
      @my_wallet = Wallet.find_by(user_id: current_user.id)
    else
    end
  end
end
