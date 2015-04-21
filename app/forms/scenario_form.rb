class ScenarioForm
  include ActiveModel::Model

  def initialize(attrs = {})
    super

    @relation = Scenario.includes(:tags)
  end

  def scenarios
    @relation
  end
end
