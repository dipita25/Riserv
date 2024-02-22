class RemoveForeignKeyUserFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :services, column: :enterprise_id
  end
end
