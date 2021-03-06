class User < ActiveRecord::Base
  has_many :authentications, dependent: :destroy
  has_many :operation_properties, dependent: :destroy

  accepts_nested_attributes_for :authentications
  accepts_nested_attributes_for :operation_properties, allow_destroy: true

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
end
