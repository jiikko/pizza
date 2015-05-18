class OperationProperty < ActiveRecord::Base
  # common　はサイトのbasic認証などでprivateはredminの個人アカウントみたいな
  enum scope: %i(scope_public scope_private)

  belongs_to :user

  def self.get(service_name, namespace, key)
    proprety = OperationProperty.find_by(
      service_name: service_name,
      namespace: namespace,
      key: key
    )
    if proprety
      proprety.value
    else
      raise("データベースに入っていませんでした。入力値を確認してだくさい")
    end
  end
end
