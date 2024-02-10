class AddStatusToSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :status, :integer, default: 0
  end
end
