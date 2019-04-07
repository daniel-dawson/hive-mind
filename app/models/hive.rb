class Hive < ActiveRecord::Base
  belongs_to :beekeeper
  has_many :entries
end
