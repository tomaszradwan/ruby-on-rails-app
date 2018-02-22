class UsersController < ApplicationController
  layout 'admin'
  before_action :check_log

  def index
    @users = User.sort
  end

  def new
  end

  def edit
  end

  def delete
  end
end
