class AccessController < ApplicationController
  layout 'admin'

  before_action :check_log, :except => [:login, :logout, :loginuser]

  def index
    @user = User.find(session[:user_id])
    @last_login = session[:last_login]
  end

  def login
  end

  def loginuser
    if params[:user].present? && params[:password].present?
      flash[:notice] = 'Hello'
      admin_search = User.where(:user => params[:user]).first
      if admin_search
        session[:last_login] =admin_search.last_login
        adm_autorisation = admin_search.authenticate(params[:password])
      end
    end

    if adm_autorisation
      session[:user_id] = adm_autorisation.id
      session[:user] = adm_autorisation.user
      flash[:notice] = 'Log in success.'
      user = User.find(session[:user_id])
      user.last_login = Time.now.strftime("%d/%m/%Y %H:%M")
      user.save
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Sorry, we don't recognize user name or password"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user] = nil
    session[:last_login] = nil
    flash[:notice] = 'Logout user !'
    redirect_to(:action => 'login')
  end
end
