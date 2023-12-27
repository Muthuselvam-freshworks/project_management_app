class AddUserAndDueDateToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true
    add_column :tasks, :due_date, :datetime
  end
end
