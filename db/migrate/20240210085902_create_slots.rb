class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.datetime :startTime
      t.datetime :endTime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
