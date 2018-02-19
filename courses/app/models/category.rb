class Category < ApplicationRecord
  has_many :pages

  scope :visibility, lambda{where(:visibility => true)}
  scope :notvisibility, lambda{where(:visibility => false)}
  scope :sort, lambda{order('categories.position ASC')}
  scope :newest, lambda{order('categories.created_at DESC')}

  validates :name,
            :presence => true,
            :length => { minimum: 2, maximum: 60, 
            :message => 'Minimum length 2 characters, maximum length 60 characters.'}
end
