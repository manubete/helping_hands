class AddPasswordResetToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :password_reset_token, :string
    add_column :organizations, :password_reset_token, :string
  end

end
