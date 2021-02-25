# Table: monthly_operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# type:                integer
# created_at:          datetime
# updated_at:          datetime

require 'rails_helper'

RSpec.describe MonthlyOperation, type: :model do
  it 'Is valid with valid attributes' do
    monthly_operation = create(:monthly_operation)
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

  it 'Is invalid without type ' do
    monthly_operation = build(:monthly_operation, type: nil)
    expect(monthly_operation).to_not be_valid
  end
  
end
