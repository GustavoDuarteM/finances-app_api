class DropRecurringOperationTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :recurring_operations
  end
end
