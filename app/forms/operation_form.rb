class OperationForm
  include ActiveModel::Model

  attr_accessor :tag_list

  def initialize(attrs = {})
    super

    @relation = Operation.includes(:tags)
  end

  def operations
    search_tag_list!
    @relation
  end

  private

  def search_tag_list!
    return if tag_list.blank?
    @relation = @relation.tagged_with(tag_list, wild: true, any: true)
  end
end
