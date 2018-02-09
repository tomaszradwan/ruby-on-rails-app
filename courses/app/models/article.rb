class Article < ApplicationRecord
  belongs_to :page

  scope :visibility, lambda{where(:visibility => true)}
  scope :notvisibility, lambda{where(:visibility => false)}
  scope :sort, lambda{order('articles.position ASC')}
  scope :newest, lambda{order('articles.created_at DESC')}

  has_attached_file :photo

  validates_attachment :photo,
                    content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ },
                    size: { less_than: 1.megabyte },
                    styles: { :medium => "500x500>", :thumb => "100x100>" }
end
