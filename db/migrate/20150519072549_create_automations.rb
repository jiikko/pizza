class CreateAutomations < ActiveRecord::Migration
  def change
    create_table :automations do |t|
      t.references :operation, null: false

      t.timestamps null: false
    end
  end
end
