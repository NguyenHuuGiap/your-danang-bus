class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :start_time
      t.integer :stop_time
      t.integer :frequence

      t.timestamps
    end
  end
end
