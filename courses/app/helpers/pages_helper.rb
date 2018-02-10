module PagesHelper
  def category_name(page)
    if page && page.category
      page.category.name
    else
      "Category not exist!"
    end  
  end
end
