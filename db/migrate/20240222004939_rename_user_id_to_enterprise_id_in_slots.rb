class RenameUserIdToEnterpriseIdInSlots < ActiveRecord::Migration[7.0]
  def change
    rename_column :slots, :user_id, :enterprise_id
  end
end
