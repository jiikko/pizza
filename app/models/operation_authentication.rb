class OperationAuthentication < ActiveRecord::Base
  # common　はサイトのbasic認証などでprivateはredminの個人アカウントみたいな
  enum scope: %i(pubic secret)

  belongs_to :user
end
