class UsersController < ApplicationController
  def login
  end

  def signup
    @user = User.new
  end


  def welcome
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      redirect_to :root, :notice => "zhucechenggong"
    else
      render :signup
    end
  end
end
