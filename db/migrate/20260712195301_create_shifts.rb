class CreateShifts < ActiveRecord::Migration[8.1]
  def change
    create_table :shifts do |t|
      t.date :date
      t.string :shift_type
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
