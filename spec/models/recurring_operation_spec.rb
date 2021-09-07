# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecurringOperation, type: :model do
  it 'Is valid with valid attributes' do
    recurring_operation = create(:recurring_operation)
    expect(recurring_operation).to be_valid
  end

  it 'Is valid without ends_in ' do
    recurring_operation = build(:recurring_operation, ends_in: nil)
    expect(recurring_operation).to be_valid
  end

  it 'Is invalid without name ' do
    recurring_operation = build(:recurring_operation, name: nil)
    expect(recurring_operation).to_not be_valid
  end

  it 'Is invalid without value ' do
    recurring_operation = build(:recurring_operation, value: nil)
    expect(recurring_operation).to_not be_valid
  end

  it 'Is invalid without starts_in ' do
    recurring_operation = build(:recurring_operation, starts_in: nil)
    expect(recurring_operation).to_not be_valid
  end

  it 'Is invalid without operations_flow ' do
    recurring_operation = build(:recurring_operation, operations_flow: nil)
    expect(recurring_operation).to_not be_valid
  end

  it 'has many operations' do
    association = RecurringOperation.reflect_on_association(:operations).macro
    expect(association).to eq(:has_many)
  end
end
