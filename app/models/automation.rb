class Automation < ActiveRecord::Base
  belongs_to :operation

  def exec
  end
end
