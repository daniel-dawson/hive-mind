class Beekeeper < ActiveRecord::Base
  validates :username, :email, :experience_level, :location, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :username, format: { with: /\A\w+\z/i }
  has_secure_password

  has_many :hives
  has_many :posts
  has_many :entries, :through => :hives
  has_many :comments, :through => :posts
end
