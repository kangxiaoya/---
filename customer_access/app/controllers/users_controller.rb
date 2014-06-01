class UsersController < ApplicationController
  def login

  end

  def create_login_session
    user =User.find_by_name(params[:name])
    if user&&user.authenticate(params[:password])
      cookies.permanent[:token]=user.token;
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to :login
  end

  def signup
    @user = User.new
  end


  def welcome
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      cookies.permanent[:token]=@user.token
      redirect_to :welcome
    else
      render :signup
    end
  end
end
