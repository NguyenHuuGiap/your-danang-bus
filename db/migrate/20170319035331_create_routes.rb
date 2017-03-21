class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.time :start_time
      t.time :stop_time
      t.integer :frequence

      t.timestamps
    end
  end
end
