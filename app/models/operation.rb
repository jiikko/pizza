class Operation < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :programs
  has_many :scenario_operations
  has_many :scenarios, through: :scenario_operations

  accepts_nested_attributes_for :programs, allow_destroy: true

  # 配列の場合スペースでhoinされるので
  def tag_list
    super.join(', ')
  end
end
