class Page < ApplicationRecord
	belongs_to :category
	has_many :articles
	
	scope :sort, lambda{order("pages.position ASC")}
	scope :visibility, lambda{where(:visibility => true)}
	scope :notvisibility, lambda{where(:visibility => false)}
	scope :newest, lambda{order("pages.created_at DESC")}
end
