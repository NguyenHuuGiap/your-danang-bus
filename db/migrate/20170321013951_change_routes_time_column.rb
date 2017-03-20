class ChangeRoutesTimeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :routes, :start_time, :integer
    change_column :routes, :stop_time, :integer
  end
end
