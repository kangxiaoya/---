class UsersController < ApplicationController

  def login

  end

  def create_login_session
    user =User.find_by_name(params[:name])
    if user&&user.authenticate(params[:password])
      cookies.permanent[:token]=user.token
      redirect_to :welcome
    else
      flash[:error]="用户名或密码错误"
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
    session[:num] = params[:page] ? params[:page].to_i : 1
    if current_user
      @users=User.paginate(:page => params[:page], :per_page => 10).where(:is_admin=>false).all

    end
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



