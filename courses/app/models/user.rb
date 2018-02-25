class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates   :name,
              :presence => true,
              :length => { :within => 3..60, :message => 'User name between 3 - 60 characters.' }

  validates   :surname,
              :presence => true,
              :length => { :within => 3..60, :message => 'User surname between 3 - 60 characters.' }

  validates   :user,
              :uniqueness => true,
              :length => { :within => 4..30, :message => 'User login between 4 - 30 characters.' }

  validates   :email,
              :presence => true,
              :format => EMAIL_REGEX,
              :confirmation => true,
              :length => { :maximum => 50}

  scope :sort, lambda{order('surname ASC , name ASC')}
end
