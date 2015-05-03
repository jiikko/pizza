class CreateProgramingLanguages < ActiveRecord::Migration
  def change
    create_table :programing_languages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
