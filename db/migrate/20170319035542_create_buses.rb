class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.string :number_plate
      t.references :routes, foreign_key: true

      t.timestamps
    end
  end
end
