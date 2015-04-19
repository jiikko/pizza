class OperationForm
  include ActiveModel::Model

  def initialize(attrs = {})
    super

    @relation = Operation.includes(:tags)
  end

  def operations
    @relation
  end
end
