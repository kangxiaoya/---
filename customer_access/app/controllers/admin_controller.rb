class AdminController < ApplicationController
  def add_users
    if current_user
      @user=User.new
    else
      redirect_to :login
    end
  end

end