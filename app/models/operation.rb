class Operation < ActiveRecord::Base
  has_many :scenario_operations
  has_many :scenarios, through: :scenario_operations

  acts_as_taggable_on :tags

  # 配列の場合スペースでhoinされるので
  def tag_list
    super.join(', ')
  end
end
