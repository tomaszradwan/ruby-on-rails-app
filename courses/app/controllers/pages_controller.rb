class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sort
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => 'Put page name'})
    @counter = Page.count + 1
    @category = Category.order('position ASC')
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = 'Page created.'
      redirect_to(:action => 'index')
    else
      @counter = page.count + 1
      @category = Category.order('position ASC')
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
      flash[:notice] = 'Page updated.'
      redirect_to(:action => 'show', :id => @page.id)
    else
      @counter = Page.count
      @category = Category.order('position ASC')
      render('edit')
    end
  end

  def delete
  end

  def page_params
    params.require(:page).permit(:category_id, :name, :position, :visibility)
  end
end
