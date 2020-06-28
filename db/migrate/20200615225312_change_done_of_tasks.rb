class ChangeDoneOfTasks < ActiveRecord::Migration[6.0]
  def up
  	change_column :tasks, :done, :integer, default: 0
  end

  def down
  	change_column :tasks, :done, :integer
  end
end
