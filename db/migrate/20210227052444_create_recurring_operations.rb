class CreateRecurringOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :recurring_operations do |t|
      t.string :name
      t.float :value
      t.date :starts_in
      t.date :ends_in
      t.integer :operation_type
      t.integer :operation_frequency

      t.timestamps
    end
  end
end
