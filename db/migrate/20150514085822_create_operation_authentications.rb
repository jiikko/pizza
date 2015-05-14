class CreateOperationAuthentications < ActiveRecord::Migration
  def change
    create_table :operation_authentications do |t|
      t.references :user, null: false
      t.integer :scope
      t.string :service_name
      t.string :key
      t.string :value
      t.boolean :masked, null: false, default: false

      t.timestamps null: false
    end
    add_index :operation_authentications, [:service_name, :key]
  end
end
