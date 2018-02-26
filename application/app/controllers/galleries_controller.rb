class GalleriesController < ApplicationController
  layout 'admin'
  before_action :check_log
  
  def index
    @galleries = Gallery.sort
  end

  def show
    @galleries = Gallery.find(params[:id])
  end

  def new
    @galleries = Gallery.new()
    @counter = Gallery.count + 1
  end

  def create
    @galleries = Gallery.new(galleries_params)
    if @galleries.save
      flash[:notice] = "Gallery '#{@galleries.name}' created successfully."
      redirect_to(:action => 'index')
    else
      flash[:danger] = "WARNING!!! You cannot create gallery!"
      @counter = Gallery.count + 1
      render('new')
    end
  end

  def edit
    @galleries = Gallery.find(params[:id])
    @counter = Gallery.count
  end

  def update
      @galleries = Gallery.find(params[:id])
    if @galleries.update_attributes(galleries_params)
      flash[:notice] = "Gallery '#{@galleries.name}' updated."
      redirect_to(:action => 'show', :id => @galleries.id)
    else
      @counter = Gallery.count
      render('edit')
    end
  end

  def delete
    @galleries = Gallery.find(params[:id])
  end

  def remove
    galleries = Gallery.find(params[:id])
    if galleries.destroy
      flash[:notice] = "Gallery '#{galleries.name}' deleted."
      redirect_to(:action => 'index')
    else
      flash[:danger] = "Error! during remove Gallery '#{galleries.name}'."
      render
    end
  end

  private
  
  def galleries_params
    params.require(:galleries).permit( :name, :position, :visibility, :describe, :photo)
  end
end
