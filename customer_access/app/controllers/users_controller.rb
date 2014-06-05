class UsersController < ApplicationController

  def login

  end

  def create_login_session
    user =User.find_by_name(params[:name])
    if user&&user.authenticate(params[:password])
      p'111111111111111'
      p user.authenticate(params[:password])
      p'222222222222222222'
      cookies.permanent[:token]=user.token
      redirect_to :welcome
    else flash[:error]="用户名或密码错误"
      redirect_to :root
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to :login
  end

  def signup
    @user =User.new
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



