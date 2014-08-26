class AddPickupNumberToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup_number, :string
  end
end
