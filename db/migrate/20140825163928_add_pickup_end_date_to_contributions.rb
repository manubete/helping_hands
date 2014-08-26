class AddPickupEndDateToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :pickup_end_date, :date
  end
end
