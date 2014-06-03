class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |col|
      col.string :organization
      col.string :resource
      col.integer :resource_count
      col.string :address
      col.string :description
      col.string :purpose
    end
  end

  def down
    drop_table :requests
  end
end
