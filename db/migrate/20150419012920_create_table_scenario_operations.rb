class CreateTableScenarioOperations < ActiveRecord::Migration
  def change
    create_table :scenario_operations do |t|
      t.integer :scenario_id, null: false, index: true
      t.integer :operation_id, null: false, index: true
      t.integer :position, null: false, default: 0

      t.index [:scenario_id, :operation_id]
      t.index [:operation_id, :scenario_id]
    end
  end
end
