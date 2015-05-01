class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.boolean :enable, default: false, null: false
      t.string :target_url
      t.text :script

      t.timestamps null: false
    end
  end
end
