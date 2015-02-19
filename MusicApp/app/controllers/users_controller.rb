class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :activate]
  before_action :activated?, except: [:new, :create, :activate]

  def show
    @user = current_user
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.send_activation_email(@user).deliver
      log_in_user! @user
      redirect_to user_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    @user = User.new(user_params)
    if @user.save
      log_in_user! @user
      redirect_to user_url
    else
      render :edit
    end
  end

  def activate
    toggle_activation params[:activation_token]
    redirect_to user_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
