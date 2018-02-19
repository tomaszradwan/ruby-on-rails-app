class Photo < ApplicationRecord
  belongs_to :gallery

  scope :visibility, lambda{where(:visibility => true)}
  scope :notvisibility, lambda{where(:visibility => false)}
  scope :sort, lambda{order('photos.position ASC')}
  scope :newest, lambda{order('photos.created_at DESC')}

  # has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "200x200" }

  has_attached_file :photo, :styles => {:thumb => "80x80>", :medium => "271x442#", :large => "600x600>"}

  validates_attachment :photo,
                       content_type: { content_type: /^image\/(png|gif|jpeg|jpg)/ },
                       size: { less_than: 1.megabyte }
                       # styles: { medium: "500x500#", thumb: "100x100#" }

  validates :name,
            :presence => true,
            :length => { minimum: 2, maximum: 60, 
            :message => 'Minimum length 2 characters, maximum length 60 characters.'}
end
