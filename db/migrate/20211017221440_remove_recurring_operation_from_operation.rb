class RemoveRecurringOperationFromOperation < ActiveRecord::Migration[6.1]
  def change
    remove_reference :operations, :recurring_operation, null: false, foreign_key: true
  end
end
