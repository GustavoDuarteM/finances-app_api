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
  belongs_to :user

  enum operation_flow: {
    inflow: 0,
    outflow: 1
  }

  # validations
  validates :name, :date_of_operation, :operation_flow, presence: true
  validates :value, numericality: { greater_than: 0 }

  # scopes
  scope :order_by_date_of_operation, lambda {
    order('date_of_operation DESC')
  }

  scope :group_by_date_of_operation, lambda {
    group_by { |operation| operation.date_of_operation.strftime('%m/%Y') }
  }

  scope :single_operations, lambda {
    where(recurring_operation_id: nil)
  }

  scope :operations_until_current_month, lambda {
    where('date_of_operation < ?', Date.today.end_of_month)
  }

  scope :operations_start_in, lambda { |start_in|
    where('date_of_operation > ?', start_in)
  }

  scope :operations_between_date, lambda { |start_in:, end_in:|
    where('date_of_operation >= ? AND date_of_operation <= ?', start_in, end_in)
  }
end
