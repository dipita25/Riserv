class RenameStartAndEndTimeToSlot < ActiveRecord::Migration[7.0]
  def change
    rename_column :slots, :startTime, :start_time
    rename_column :slots, :endTime, :end_time
  end
end
