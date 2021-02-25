class CreateMonthlyOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_operations do |t|
      t.string :name
      t.float :value
      t.date :date_of_operation
      t.integer :type

      t.timestamps
    end
  end
end
