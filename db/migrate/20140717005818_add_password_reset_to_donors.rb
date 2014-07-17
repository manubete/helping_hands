class AddPasswordResetToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :password_reset_token, :string
    add_column :donors, :password_reset_sent_at, :datetime
  end
end
