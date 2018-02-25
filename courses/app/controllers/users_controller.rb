class UsersController < ApplicationController
  layout 'admin'
  before_action :check_log

  def index
    @users = User.sort
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User '#{@user.name}' created."
      redirect_to(:action  => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :user, :email, :password, :password_confirmation)
  end
end