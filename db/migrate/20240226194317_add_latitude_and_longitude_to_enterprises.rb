class AddLatitudeAndLongitudeToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :latitude, :float
    add_column :enterprises, :longitude, :float
  end
end
