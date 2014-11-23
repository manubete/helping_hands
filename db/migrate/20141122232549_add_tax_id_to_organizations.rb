class AddTaxIdToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :tax_id, :string
  end
end
