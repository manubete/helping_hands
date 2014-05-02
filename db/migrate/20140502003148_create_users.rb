class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: nil
      t.string :user_token
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end