class Operation < ActiveRecord::Base
  has_and_belongs_to_many :scenarios

  acts_as_taggable_on :tags

  # 配列の場合スペースでhoinされるので
  def tag_list
    super.join(', ')
  end
end
