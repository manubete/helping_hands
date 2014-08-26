class AddPickupStartTimeToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup_start_time, :time
  end
end
