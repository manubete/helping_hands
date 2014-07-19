class CreateDonors < ActiveRecord::Migration
  def up
     create_table :donors do |col|
      col.string :name
      col.string :city
      col.string :address
      col.string :phone_number
      col.string :email
      col.string :password
      col.string :security_question
      col.string :security_answer
    end
  end

  def down
    drop_table :donors
  end
end
