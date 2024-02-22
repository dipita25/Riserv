class AddForeignKeyEnterpriseFromSlots < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "slots", "enterprises", column: "enterprise_id"
  end
end
