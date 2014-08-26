class AddPickupStartDateToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup_start_date, :date
  end
end
