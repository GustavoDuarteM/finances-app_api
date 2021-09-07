# frozen_string_literal: true

# Table: recurring_operations
# id:                integer
# name:              string
# value:             float
# starts_in:         date
# ends_in:           date
# operations_flow:    integer
# created_at:        datetime
# updated_at:        datetime
# deleted_at:        datetime

class RecurringOperation < ApplicationRecord
  belongs_to :user
  has_many :operations

  validates :name, :starts_in, :operations_flow, presence: true
  validates :value, numericality: { greater_than: 0 }

  enum operations_flow: {
    inflows: 0,
    outflow: 1
  }

  enum operations_frequency: {
    monthly: 1
  }
end
