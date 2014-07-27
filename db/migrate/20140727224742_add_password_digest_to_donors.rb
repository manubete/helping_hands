class AddPasswordDigestToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :password_digest, :string
  end
end
