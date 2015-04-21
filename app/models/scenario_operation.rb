class ScenarioOperation < ActiveRecord::Base
  belongs_to :operation
  belongs_to :scenario
end
