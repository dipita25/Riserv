class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
