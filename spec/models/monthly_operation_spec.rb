# frozen_string_literal: true

# Table: monthly_operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# type_operation:      integer
# created_at:          datetime
# updated_at:          datetime

require 'rails_helper'

RSpec.describe MonthlyOperation, type: :model do
  it 'Is valid with valid attributes' do
    monthly_operation = create(:monthly_operation)
    expect(monthly_operation).to be_valid
  end

  it 'Is valid without recurring_operation ' do
    monthly_operation = build(:monthly_operation, recurring_operation: nil)
    expect(monthly_operation).to be_valid
  end

  it 'Is invalid without name ' do
    monthly_operation = build(:monthly_operation, name: nil)
    expect(monthly_operation).to_not be_valid
  end

  it 'Is invalid without value ' do
    monthly_operation = build(:monthly_operation, value: nil)
    expect(monthly_operation).to_not be_valid
  end

  it 'Is invalid without date_of_operation ' do
    monthly_operation = build(:monthly_operation, date_of_operation: nil)
    expect(monthly_operation).to_not be_valid
  end

  it 'Is invalid without operation_type ' do
    monthly_operation = build(:monthly_operation, operation_type: nil)
    expect(monthly_operation).to_not be_valid
  end

  it 'belongs to recurring operation' do
    association = MonthlyOperation.reflect_on_association(:recurring_operation).macro
    expect(association).to eq(:belongs_to)
  end
end
