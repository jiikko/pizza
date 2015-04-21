class Scenario < ActiveRecord::Base
  has_and_belongs_to_many :operations

  acts_as_taggable_on :tags
end
