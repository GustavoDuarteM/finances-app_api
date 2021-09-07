# frozen_string_literal: true

# Table: operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# operation_flow:      integer
# created_at:          datetime
# updated_at:          datetime

class Operation < ApplicationRecord
  belongs_to :recurring_operation, optional: true
  belongs_to :user

  enum operation_flow: {
    inflow: 0,
    outflow: 1
  }

  validates :name, :date_of_operation, :operation_flow, presence: true
  validates :value, numericality: { greater_than: 0 }
end
