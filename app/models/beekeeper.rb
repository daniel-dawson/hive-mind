class Beekeeper < ActiveRecord::Base
  has_secure_password

  has_many :hives
  has_many :posts
  has_many :entries, :through => :hives
  has_many :comments, :through => :posts
end
