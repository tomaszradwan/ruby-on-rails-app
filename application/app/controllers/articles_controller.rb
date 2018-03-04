class ArticlesController < ApplicationController
  layout 'admin'
  before_action :check_log, :category_id

  def index
    @pages = Page.find(params[:id])
    @articles = @pages.articles.sort
    @category = Category.find(params[:category_id])
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new()
    @page = Page.order('position ASC')
    @counter = Article.count + 1
  end

  def create
      @articles = Article.new(articles_params)
    if @articles.save
      flash[:notice] = "Article '#{@articles.name}' created successfully."
      redirect_to(:action => 'index', :id => @articles.id, :category_id => @category_id,
        :page_id => params[:page_id])
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
      redirect_to(:action => 'show', :id => @articles.id, :category_id => @category_id,
        :page_id => params[:page_id])
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
      redirect_to(:action => 'index', :id => params[:page_id], :category_id => @category_id)
    else
      flash[:notice] = "Error! during remove Article '#{articles.name}'."
      render
    end
  end

  private

  def articles_params
    params.require(:articles).permit(:page_id, :name, :position, :visibility, :content, :photo)
  end

  def category_id
    @category_id = params[:category_id]
  end
end
