class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.text :code
      t.references :programing_language, null: false
      t.references :operation, null: false, index: true

      t.timestamps null: false
    end
  end
end
