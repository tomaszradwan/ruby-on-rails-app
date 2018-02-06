class Article < ApplicationRecord
	belongs_to :pages

	# has_attached_file :photos, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :photos, content_type: /\Aimage\/.*\z/


	has_attached_file :photos, styles: { medium: "600x600>", thumb: "200x200>" }

  validates_attachment_content_type :photos, 
  																	:content_type => /^image\/(png|gif|jpeg)/ ,
  																	:message => '---> Only PNG, GIF, JPEG file. <---'
	
	validates_attachment :photos, 
												:in => 0..1000.kilobytes,
												:message => '---> Max size of file 1000kB <---'

	scope :sort, lambda{order("articles.position ASC")}
	scope :visibility, lambda{where(:visibility => true)}
	scope :notvisibility, lambda{where(:visibility => false)}
	scope :newest, lambda{order("articles.created_at DESC")}
end
