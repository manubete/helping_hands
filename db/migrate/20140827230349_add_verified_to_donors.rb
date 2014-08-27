class AddVerifiedToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :verified, :boolean
  end
end
