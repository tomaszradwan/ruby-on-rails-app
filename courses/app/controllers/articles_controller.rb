class ArticlesController < ApplicationController
  layout 'admin'

  def index
    @articles = Article.sort
  end

  def new
    @articles = Article.new({:name => 'TEST'})
    @page = Page.order('position ASC')
    @counter = Article.count + 1
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article '#{@article.name}' created."
      redirect_to(:action => 'index')
    else
      @counter = Article.count + 1
      @category = Article.order('position ASC')
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  def show
  end

  def article_params
    params.require(:article).permit(:page_id, :name, :position, :visibility,:photos)
  end
end
