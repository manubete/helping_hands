class ChangeDescriptionFormatInOrganizations < ActiveRecord::Migration
  def up
    change_column :organizations, :description, :text
  end

  def down
    change_column :organizations, :description, :string
  end
end
