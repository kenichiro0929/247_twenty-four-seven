class AddElapsedTimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :elapsed_time, :integer
  end
end
