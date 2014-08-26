class AddPickupToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup, :boolean
  end
end
