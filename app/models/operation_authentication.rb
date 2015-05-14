class OperationAuthentication < ActiveRecord::Base
  # common　はサイトのbasic認証などでprivateはredminの個人アカウントみたいな
  enum scope: %i(scope_public scope_private)

  belongs_to :user
end
