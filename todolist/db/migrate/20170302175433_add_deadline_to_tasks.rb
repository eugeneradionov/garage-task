class AddDeadlineToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :deadline, :date, default: nil
  end
end
