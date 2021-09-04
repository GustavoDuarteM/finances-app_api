# frozen_string_literal: true

class SingleOperation < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_operation, :operation_type, presence: true
  validates :value, numericality: { greater_than: 0 }

  enum operation_type: {
    onflows: 0,
    outflow: 1
  }
end
