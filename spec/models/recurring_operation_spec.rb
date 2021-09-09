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

  %i[name value starts_in operations_flow operations_frequency].each do |atribute|
    it "Is invalid without #{atribute}" do
      recurring_operation = build(:recurring_operation, "#{atribute}": nil)
      expect(recurring_operation).to_not be_valid
    end
  end

  it 'has many operations' do
    association = RecurringOperation.reflect_on_association(:operations).macro
    expect(association).to eq(:has_many)
  end
end
