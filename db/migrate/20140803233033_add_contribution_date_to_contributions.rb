class AddContributionDateToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :contribution_date, :date
  end
end
