class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by_session_token(self.session[:session_token])
  end

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    self.session[:session_token] = nil
  end

  def require_login
    unless current_user
      redirect_to new_session_url
    end
  end

  def correct_user?
    unless current_user.id == params[:id].to_i
      redirect_to user_url(current_user.id)
    end
  end

  def correct_author?
    unless current_user.id == Post.find(params[:id]).author_id
      redirect_to user_url(current_user.id)
    end
  end
end
