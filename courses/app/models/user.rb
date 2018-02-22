class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates   :name,
              :presence => true

  validates   :surname,
              :presence => true

  validates   :user,
              :length => { :within => 4..30, :message => 'User name between 4 - 30 characters.' },
              :uniqueness => true

  validates   :email,
              :presence => true,
              :length => { :maximum => 50},
              :format => EMAIL_REGEX, 
              :confirmation => true

  scope :sort, lambda{order('surname ASC , name ASC')}
end
