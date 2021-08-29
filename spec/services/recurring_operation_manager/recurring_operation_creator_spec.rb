# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecurringOperationManager::RecurringOperationCreator do
  it '#call' do
    recurring_operation = build(:recurring_operation)
    creator_result = RecurringOperationManager::RecurringOperationCreator.new(recurring_operation).call
    number_of_monthly_operations = (recurring_operation.starts_in..recurring_operation.ends_in).map do |date|
      [date.month, date.year]
    end.uniq.count
    expect(recurring_operation.monthly_operations.count).to eq(number_of_monthly_operations)
    expect(creator_result).to eq(true)
  end
end
