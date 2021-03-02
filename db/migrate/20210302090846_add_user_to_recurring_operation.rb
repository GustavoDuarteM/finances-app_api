class AddUserToRecurringOperation < ActiveRecord::Migration[6.1]
  def change
    add_reference :recurring_operations, :users, null: false, foreign_key: true
  end
end
