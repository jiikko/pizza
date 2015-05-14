class CreateOperationAuthentications < ActiveRecord::Migration
  def change
    create_table :operation_authentications do |t|
      t.references :uesr, null: false
      t.integer :auth_type
      t.string :service_name
      t.string :key
      t.string :value

      t.timestamps null: false
    end
    add_index :operation_authentications, [:service_name, :key]
  end
end
