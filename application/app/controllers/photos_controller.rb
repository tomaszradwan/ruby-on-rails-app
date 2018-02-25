class PhotosController < ApplicationController
  layout 'admin'
  before_action :check_log
  
  def index
    @photos = Photo.sort
  end

  def show
    @photos = Photo.find(params[:id])
  end

  def new
    @photos = Photo.new()
    @counter = Photo.count + 1
    @gallery = Gallery.order('position ASC')
  end

  def create
    @photos = Photo.new(photos_params)
    if @photos.save
      flash[:notice] = "Photo '#{@photos.name}' created successfully."
      redirect_to(:action => 'index')
    else
      @counter = Photo.count + 1
      @gallery = Gallery.order('position ASC')
      render('new')
    end
  end

  def edit
    @photos = Photo.find(params[:id])
    @counter = Photo.count
    @gallery = Gallery.order('position ASC')
  end

  def update
    @photos = Photo.find(params[:id])
    if @photos.update_attributes(photos_params)
      flash[:notice] = "Photo '#{@photos.name}' updated."
      redirect_to(:action => 'show', :id => @photos.id)
    else
      @counter = Photo.count + 1
      @gallery = Gallery.order('position ASC')
      render('new')
    end
  end

  def delete
    @photos = Photo.find(params[:id])
  end

  def remove
    photos = Photo.find(params[:id])
    if photos.destroy
      flash[:notice] = "Gallery '#{photos.name}' deleted."
      redirect_to(:action => 'index')
    else
      flash[:danger] = "Error! during remove Photo '#{photos.name}'."
      render
    end
  end

  def photos_params
    params.require(:photos).permit(:name, :gallery_id, :position, :visibility, :photo, :describe)
  end
end
