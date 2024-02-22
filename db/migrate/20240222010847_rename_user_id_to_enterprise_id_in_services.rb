class RenameUserIdToEnterpriseIdInServices < ActiveRecord::Migration[7.0]
  def change
    rename_column :services, :user_id, :enterprise_id
  end
end
