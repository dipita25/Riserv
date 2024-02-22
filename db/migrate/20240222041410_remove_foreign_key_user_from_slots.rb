class RemoveForeignKeyUserFromSlots < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :slots, column: :enterprise_id
  end
end
