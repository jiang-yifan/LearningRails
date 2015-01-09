class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :admin?

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user! user
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def activated?
    unless current_user.activated
      redirect_to new_session_url
      log_out!
    end
  end

  def toggle_activation token
    @user = User.find_by(activation_token: token)
    if @user
      @user.toggle(:activated).save
    end
  end

  def admin?
    current_user.admin
  end
end
