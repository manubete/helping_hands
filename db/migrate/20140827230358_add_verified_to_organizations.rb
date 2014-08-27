class AddVerifiedToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :verified, :boolean
  end
end
