class CreateCodeLanguages < ActiveRecord::Migration
  def change
    create_table :code_languages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
