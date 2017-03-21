class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_locations do |t|
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end

    add_index :user_locations, :user_id
  end
end
