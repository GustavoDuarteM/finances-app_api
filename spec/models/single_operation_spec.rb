# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SingleOperation, type: :model do
  it 'Is valid with valid attributes' do
    single_operation = create(:single_operation)
    expect(single_operation).to be_valid
  end

  it 'Is invalid without name ' do
    single_operation = build(:single_operation, name: nil)
    expect(single_operation).to_not be_valid
  end

  it 'Is invalid without value ' do
    single_operation = build(:single_operation, value: nil)
    expect(single_operation).to_not be_valid
  end

  it 'Is invalid without date_of_operation ' do
    single_operation = build(:single_operation, date_of_operation: nil)
    expect(single_operation).to_not be_valid
  end

  it 'Is invalid without operation_type ' do
    single_operation = build(:single_operation, operation_type: nil)
    expect(single_operation).to_not be_valid
  end

  it 'belongs to recurring operation' do
    association = SingleOperation.reflect_on_association(:user).macro
    expect(association).to eq(:belongs_to)
  end
end
