class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |col|
      col.belongs_to :organization
      col.string :resource
      col.integer :target_resource_count
      col.integer :current_resource_count, :default => 0
      col.string :address
      col.string :organization
      col.string :description
      col.date :start_date
      col.date :end_date
      col.boolean :complete, :default => false
    end
  end

  def down
     drop_table :requests
  end
end
