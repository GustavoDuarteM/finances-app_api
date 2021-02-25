# Table: monthly_operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# type:                integer
# created_at:          datetime
# updated_at:          datetime

class MonthlyOperation < ApplicationRecord
  validates :name, :date_of_operation, :type, presence: true
  validates :value, numericality: { greater_than: 0 }

  enum type: {
    onflows: 0,
    outflow: 1
  }

end
