class PagesController < ApplicationController
  layout 'admin'
  before_action :check_log
  
  def index
    @pages = Page.sort
  end

  def show
    @pages = Page.find(params[:id])
  end

  def new
    @counter = Page.count + 1
    @category = Category.order('position ASC')
  end

  def create
    @pages = Page.new(pages_params)
    if @pages.save
      flash[:notice] = "Page '#{@pages.name}' created."
      redirect_to(:action => 'index')
    else
      @counter = Page.count + 1
      @category = Category.order('position ASC')
      flash[:danger] = "WARNING!!! You cannot create the page!"
      render('new')
    end
  end

  def edit
    @pages = Page.find(params[:id])
    @counter = Page.count
    @category = Category.order('position ASC')
  end

  def update
    @pages = Page.find(params[:id])
    if @pages.update_attributes(pages_params)
      flash[:notice] = "Page '#{@pages.name}' updated."
      redirect_to(:action => 'show', :id => @pages.id)
    else
      @counter = Page.count
      @category = Category.order('position ASC')
      render('edit')
    end
  end

  def delete
    @pages = Page.find(params[:id])
  end

  def remove
    pages = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{pages.name}' deleted."
    redirect_to(:action => 'index')  
  end

  def pages_params
    params.require(:pages).permit(:category_id, :name, :position, :visibility)
  end
end
