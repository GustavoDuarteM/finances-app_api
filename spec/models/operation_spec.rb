# frozen_string_literal: true

# Table: operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# type_operation:      integer
# created_at:          datetime
# updated_at:          datetime

require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'Is valid with valid attributes' do
    operation = create(:operation)
    expect(operation).to be_valid
  end

  it 'Is valid without recurring_operation ' do
    operation = build(:operation, recurring_operation: nil)
    expect(operation).to be_valid
  end

  it 'Is invalid without name ' do
    operation = build(:operation, name: nil)
    expect(operation).to_not be_valid
  end

  it 'Is invalid without value ' do
    operation = build(:operation, value: nil)
    expect(operation).to_not be_valid
  end

  it 'Is invalid without date_of_operation ' do
    operation = build(:operation, date_of_operation: nil)
    expect(operation).to_not be_valid
  end

  it 'Is invalid without operation_type ' do
    operation = build(:operation, operation_type: nil)
    expect(operation).to_not be_valid
  end

  it 'belongs to recurring operation' do
    association = Operation.reflect_on_association(:recurring_operation).macro
    expect(association).to eq(:belongs_to)
  end
end
