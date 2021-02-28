module RecurringOperationManager
  class RecurringOperationCreator < ApplicationService
    attr_accessor :recurring_operation

    def initialize(recurring_operation)
      @recurring_operation = recurring_operation
    end

    def call
      due_date = @recurring_operation.starts_in.beginning_of_month
      ends = @recurring_operation.ends_in || Time.now

      while due_date <= ends
        @recurring_operation.monthly_operations.new(
          name: @recurring_operation.name,
          value: @recurring_operation.value,
          date_of_operation: calculate_due_date(due_date),
          operation_type: @recurring_operation.operation_type
        )
        due_date += 1.month
      end
      @recurring_operation.save
    end

    private

    def calculate_due_date(due_date)
      temp_date = due_date.change({ day: @recurring_operation.starts_in.day })
      if temp_date.month == due_date.month
        due_date.change({ day: @recurring_operation.starts_in.day })
      else
        due_date.end_of_month
      end
    end
  end
end
