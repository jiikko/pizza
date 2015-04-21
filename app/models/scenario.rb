class Scenario < ActiveRecord::Base
  has_many :scenario_operations
  has_many :operations, through: :scenario_operations

  acts_as_taggable_on :tags
end
