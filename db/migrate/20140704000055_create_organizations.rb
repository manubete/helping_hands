class CreateOrganizations < ActiveRecord::Migration
  def up
     create_table :organizations do |col|
      col.string :name
      col.string :city
      col.string :address
      col.string :phone_number
      col.string :email
      col.string :website_url
      col.string :linked_in_url
      col.string :facebook_url
      col.string :username
      col.string :password
    end
  end

  def down
    drop_table :organizations
  end
end
