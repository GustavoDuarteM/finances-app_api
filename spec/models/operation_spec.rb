# frozen_string_literal: true

# Table: operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# step:                integer
# type_operation:      integer
# created_at:          datetime
# updated_at:          datetime

require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'Is valid with valid attributes' do
    operation = create(:operation)
    expect(operation).to be_valid
  end

  %i[name value date_of_operation operation_flow].each do |atribute|
    it "Is invalid without #{atribute}" do
      operation = build(:operation, "#{atribute}": nil)
      expect(operation).to_not be_valid
    end
  end
end
