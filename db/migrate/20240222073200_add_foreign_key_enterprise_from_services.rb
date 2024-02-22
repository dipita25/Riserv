class AddForeignKeyEnterpriseFromServices < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "services", "enterprises", column: "enterprise_id"
  end
end
