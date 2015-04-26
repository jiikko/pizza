class Scenario < ActiveRecord::Base
  has_many :scenario_operations
  has_many :operations, through: :scenario_operations

  accepts_nested_attributes_for :scenario_operations, allow_destroy: true

  acts_as_taggable_on :tags
end
