class ArticlesController < ApplicationController
  layout 'admin'

  def index
    @articles = Article.sort
  end

  def new
  end

  def edit
  end

  def delete
  end

  def show
  end
end
