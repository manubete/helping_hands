class AddPhotoToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :photo, :string
  end
end
