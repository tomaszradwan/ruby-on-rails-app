class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.sort
  end

  def show
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
  end

  def delete
  end

  def page_params
    params.require(:page).permit(:category_id, :name, :position, :visibility)
  end
end
