class Article < ApplicationRecord
	belongs_to :pages

	scope :sort, lambda{order("articles.position ASC")}
	scope :visibility, lambda{where(:visibility => true)}
	scope :notvisibility, lambda{where(:visibility => false)}
	scope :newest, lambda{order("articles.created_at DESC")}
end
