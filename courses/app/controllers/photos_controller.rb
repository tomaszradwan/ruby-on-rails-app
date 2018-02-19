class PhotosController < ApplicationController
  layout 'admin'

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
  end

  def delete
  end

  def photos_params
    params.require(:photos).permit(:name, :gallery_id, :position, :visibility, :photo, :describe)
  end
end
