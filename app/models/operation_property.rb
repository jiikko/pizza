class OperationProperty < ActiveRecord::Base
  # common　はサイトのbasic認証などでprivateはredminの個人アカウントみたいな
  enum scope: %i(scope_public scope_private)

  belongs_to :user

  validates_uniqueness_of :scope
end
