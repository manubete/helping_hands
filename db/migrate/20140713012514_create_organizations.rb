class CreateOrganizations < ActiveRecord::Migration
  def up
     create_table :organizations do |col|
      col.string :name
      col.string :description
      col.string :city
      col.string :address
      col.string :operation_days
      col.time :opening_time
      col.time :closing_time
      col.string :phone_number
      col.string :email
      col.string :website_url
      col.string :linked_in_url
      col.string :facebook_url
      col.string :password
      col.string :security_question
      col.string :security_answer

    end
  end

  def down
    drop_table :organizations
  end
end
