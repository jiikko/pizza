class CreateOperationAuthentications < ActiveRecord::Migration
  def change
    create_table :operation_properties do |t|
      t.references :user, null: false
      t.integer :scope
      t.string :service_name
      t.string :namespace
      t.string :key
      t.string :value
      t.boolean :masked, null: false, default: false

      t.timestamps null: false
    end
    add_index :operation_properties, [:service_name, :namespace, :key], unique: true
  end
end
