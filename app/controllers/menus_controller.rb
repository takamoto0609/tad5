class MenusController < ApplicationController
  def give
  end

  def take
  end

  def point
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def how_to_use
  end
end
