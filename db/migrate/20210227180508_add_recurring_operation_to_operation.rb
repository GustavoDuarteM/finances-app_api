class AddRecurringOperationToOperation < ActiveRecord::Migration[6.1]
  def change
    add_reference :operations, :recurring_operation, null: true, foreign_key: true
  end
end
