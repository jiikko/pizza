class OperationAuthentication < ActiveRecord::Base
  # common　はサイトのbasic認証などでprivateはredminの個人アカウントみたいな
  enum :auth_type, %i(common private)
end
