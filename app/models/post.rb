class Post < ActiveRecord::Base
  belongs_to :beekeeper
  has_many :comments
end
