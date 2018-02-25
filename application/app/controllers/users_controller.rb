class UsersController < ApplicationController
  layout 'admin'
  before_action :check_log

  def index
    @users = User.sort
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User account '#{@user.name}' created."
      redirect_to(:action  => 'index')
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User account '#{@user.name}' updated."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def remove
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "User account '#{user.name}' deleted."
      redirect_to(:action => 'index')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :user, :email, :password, :password_confirmation)
  end
end
