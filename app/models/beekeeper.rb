class Beekeeper < ActiveRecord::Base
  validates :username, :email, :experience, :location, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: "must be of format letters_and_numbers@email.com" }
  validates :username, format: { with: /\A\w+\z/i,
    message: "must only contain letters, numbers, and underscores"}
  has_secure_password

  has_many :hives
  has_many :posts
  has_many :entries, :through => :hives
  has_many :comments, :through => :posts
end
