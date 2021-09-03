class AddDeletedAtToMonthlyOperations < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_operations, :deleted_at, :datetime
    add_index :monthly_operations, :deleted_at
  end
end
