class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  #ログインテスト用
=begin
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
=end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
