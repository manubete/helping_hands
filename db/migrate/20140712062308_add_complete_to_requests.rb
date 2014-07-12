class AddCompleteToRequests < ActiveRecord::Migration
  def up
    add_column :requests, :complete, :boolean
  end

  def down
    remove_column :requests, :complete, :boolean
  end
end
