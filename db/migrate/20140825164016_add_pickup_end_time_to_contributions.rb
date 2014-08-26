class AddPickupEndTimeToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup_end_time, :time
  end
end
