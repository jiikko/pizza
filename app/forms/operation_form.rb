class OperationForm
  include ActiveModel::Model

  def initialize(attrs = {})
    super

    @relation = Operation.all
  end

  def operations
    @relation
  end
end
