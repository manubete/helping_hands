class CreateDonors < ActiveRecord::Migration
  def up
    create_table :donors do |col|
      col.string :name
      col.string :city
      col.string :phone_number
      col.string :email
      col.string :username
      col.string :password
    end
  end

  def down
    drop_table :donors
  end
end
