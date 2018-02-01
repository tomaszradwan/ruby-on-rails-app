# README

===========

If you have a problem with bcrypt_ext:

"cannot load such file — bcrypt_ext"

, below it is my solution.

Windows 8.1 64bit
ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]
Rails 5.1.4

My solution:

gem uninstall bcrypt-ruby
gem uninstall bcrypt
gem install bcrypt –platform=ruby
added this whole line to Gemfile:
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

bundle install