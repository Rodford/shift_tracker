class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :is_completed
      t.datetime :completed_at
      t.references :shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
