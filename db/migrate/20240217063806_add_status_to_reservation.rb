class AddStatusToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :status, :boolean
  end
end
