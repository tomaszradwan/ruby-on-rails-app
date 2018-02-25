class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def check_log
    unless session[:user_id]
      flash[:notice] = 'Not log in.'
      redirect_to(:controller => 'access', :action => 'loginuser')
      return false
    else
      return true
    end
  end
end
