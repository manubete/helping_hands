class CreateContributions < ActiveRecord::Migration
  def up
    create_table :contributions do |col|
      col.belongs_to :donor
      col.belongs_to :request
      col.integer :resource_amount
    end
  end

  def down
    drop_table :contributions
  end
end
