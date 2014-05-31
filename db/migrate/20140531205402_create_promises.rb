class CreatePromises < ActiveRecord::Migration
  def up
    create_table :promises do |col|
      col.string :organization
      col.string :resource
      col.integer :resource_count
      col.string :address
      col.string :description
      col.string :disaster
    end
  end

  def down
    drop_table :promises
  end
end
