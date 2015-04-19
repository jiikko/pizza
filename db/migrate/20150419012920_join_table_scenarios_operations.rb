class JoinTableScenariosOperations < ActiveRecord::Migration
  def change
    create_join_table :scenarios, :operations do |t|
      t.index [:scenario_id, :operation_id]
      t.index [:operation_id, :scenario_id]
    end
  end
end
