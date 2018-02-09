class ArticlesController < ApplicationController
  layout 'admin'

  def index
    @articles = Article.sort
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new({:name => "Put name of article"})
    @page = Page.order('position ASC')
    @counter = Article.count + 1
  end

  def create
      @articles = Article.new(articles_params)
    if @articles.save
      flash[:notice] = "Article '#{@articles.name}' created successfully."
      redirect_to(:action => 'index')
    else
      @counter = Article.count + 1
      @page = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @articles = Article.find(params[:id])
    @counter = Article.count
  end

  def update
    @articles = Article.find(params[:id])
    if @articles.update_attributes(articles_params)
      flash[:notice] = "Page '#{@articles.name}' updated."
      redirect_to(:action => 'show', :id => @articles.id)
    else
      @counter = Article.count
      render('edit')
    end

  end

  def delete
    @articles = Article.find(params[:id])
  end

  def remove
    articles = Article.find(params[:id])
    if articles.destroy
      flash[:notice] = "Article '#{articles.name}' deleted."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Error during remove Article '#{articles.name}'."
      render
    end
  end

  def articles_params
    params.require(:articles).permit(:page_id, :name, :position, :visibility, :content, :photo)
  end
end
