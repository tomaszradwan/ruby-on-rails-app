class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sort
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
