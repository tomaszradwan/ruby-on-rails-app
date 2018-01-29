class CategoriesController < ApplicationController
  layout false

  def index
    @category = Category.sort
  end

  def show
  end

  def new
    @category_form = Category.new({:name => 'Put category name'})
    @counter = Category.count + 1
  end

  def edit
  end

  def delete
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action => 'index')
    else
      @counter = Category.count + 1
      render('new')
    end
  end

  def category_params
    params.require(:category_form).permit(:name, :position, :visibility)
  end
end
