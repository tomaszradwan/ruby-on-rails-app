class AccessController < ApplicationController
  layout 'admin'

  before_action :check_log, :except => [:login, :logout, :loginuser]

  def index
  end

  def login
  end

  def loginuser
    if params[:user].present? && params[:password].present?
      flash[:notice] = 'cos tam'
      admin_search = User.where(:user => params[:user]).first
      if admin_search
        adm_autorisation = admin_search.authenticate(params[:password])
      end
    end

    if adm_autorisation
      session[:user_id] = adm_autorisation.id
      session[:user] = adm_autorisation.user
      flash[:notice] = 'Log in success.'
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Sorry, we don't recognize user name or password"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = 'Logout!'
    redirect_to(:action => 'login')
  end
end
