module ArticlesHelper
    def page_name(article)
    if article && article.page
      article.page.name
    else
      "Page not exist!"
    end  
  end
end
