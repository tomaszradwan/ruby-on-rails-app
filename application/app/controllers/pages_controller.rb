class PagesController < ApplicationController
  layout 'admin'
  before_action :check_log
  
  def index
    @category = Category.find(params[:category_id])
    @pages = @category.pages.sort
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @counter = Page.count + 1
    @category = Category.order('position ASC')
    @category_id = params[:category_id]
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page '#{@page.name}' created."
      redirect_to(:action => 'index', :category_id => @page.category_id)
    else
      @counter = Page.count + 1
      @category = Category.order('position ASC')
      flash[:danger] = "WARNING!!! You cannot create the page!"
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @counter = Page.count
    @category = Category.order('position ASC')
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page '#{@page.name}' updated."
      redirect_to(:action => 'show', :id => @page.id)
    else
      @counter = Page.count
      @category = Category.order('position ASC')
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def remove
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' deleted."
    redirect_to(:action => 'index', :category_id => page.category_id)
  end

  private

  def page_params
    params.require(:page).permit(:category_id, :name, :position, :visibility)
  end
end
