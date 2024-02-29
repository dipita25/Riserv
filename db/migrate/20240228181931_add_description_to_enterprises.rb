class AddDescriptionToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :description, :string
  end
end
