require_relative 'concerns/slug'
class Hive < ActiveRecord::Base
  include Slug

  validates :name, :hive_type, :bee_type, :location, presence: true
  validates :name, uniqueness: { scope: :beekeeper_id, case_sensitive: false }
  validates :beekeeper, presence: true

  belongs_to :beekeeper
  has_many :entries
end
