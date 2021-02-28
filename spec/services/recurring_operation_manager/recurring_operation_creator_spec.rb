require 'rails_helper'

RSpec.describe RecurringOperationManager::RecurringOperationCreator, type: :model do
  it "#call" do
    recurring_operation = build(:recurring_operation)
    creator_result = RecurringOperationManager::RecurringOperationCreator.call(recurring_operation)
    number_of_monthly_operations = (recurring_operation.starts_in..recurring_operation.ends_in).map { |date| [date.month, date.year] }.uniq.count
    expect(recurring_operation.monthly_operations.count).to eq(number_of_monthly_operations)
    expect(creator_result).to eq(true)
  end
end