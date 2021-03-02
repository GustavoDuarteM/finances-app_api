class AddUserToMonthlyOperations < ActiveRecord::Migration[6.1]
  def change
    add_reference :monthly_operations, :user, null: false, foreign_key: true
  end
end
