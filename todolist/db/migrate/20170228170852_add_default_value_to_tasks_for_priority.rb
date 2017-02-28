class AddDefaultValueToTasksForPriority < ActiveRecord::Migration[5.0]
  def up
    change_column :tasks, :priority, :integer, default: 1
  end

  def down
    change_column :tasks, :priority, :integer, default: nil
  end
end
