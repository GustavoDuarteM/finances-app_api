# frozen_string_literal: true

# Table: recurring_operations
# id:                integer
# name:              string
# value:             float
# starts_in:         date
# ends_in:           date
# operation_type:    integer
# created_at:        datetime
# updated_at:        datetime
# deleted_at:        datetime

class RecurringOperation < ApplicationRecord
  belongs_to :user
  has_many :monthly_operations

  validates :name, :starts_in, :operation_type, presence: true
  validates :value, numericality: { greater_than: 0 }

  enum operation_type: {
    onflows: 0,
    outflow: 1
  }
end
