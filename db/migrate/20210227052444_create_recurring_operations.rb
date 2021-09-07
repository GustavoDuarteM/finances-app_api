class CreateRecurringOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :recurring_operations do |t|
      t.string :name
      t.float :value
      t.date :starts_in
      t.date :ends_in
      t.integer :operations_flow
      t.integer :operations_frequency

      t.timestamps
    end
  end
end
