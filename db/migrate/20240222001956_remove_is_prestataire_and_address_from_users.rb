class RemoveIsPrestataireAndAddressFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :isPrestataire, :boolean
    remove_column :users, :address, :string
  end
end
