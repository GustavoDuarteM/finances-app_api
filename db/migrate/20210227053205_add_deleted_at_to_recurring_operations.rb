class AddDeletedAtToRecurringOperations < ActiveRecord::Migration[6.1]
  def change
    add_column :recurring_operations, :deleted_at, :datetime
    add_index :recurring_operations, :deleted_at
  end
end
