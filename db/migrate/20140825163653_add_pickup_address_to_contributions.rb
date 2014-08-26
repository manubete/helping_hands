class AddPickupAddressToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickupAddress, :string
  end
end
