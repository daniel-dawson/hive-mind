require_relative 'concers/slug'
class Hive < ActiveRecord::Base
  include Slug
  belongs_to :beekeeper
  has_many :entries
end
