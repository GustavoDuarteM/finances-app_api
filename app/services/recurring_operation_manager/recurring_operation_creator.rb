# frozen_string_literal: true

module RecurringOperationManager
  class RecurringOperationCreator
    def initialize(recurring_operation)
      @recurring_operation = recurring_operation
      @user = recurring_operation.user
      @ends = @recurring_operation.ends_in || Time.now
    end

    def call
      due_date = @recurring_operation.starts_in.beginning_of_month
      while due_date <= @ends
        add_recurring_operation(due_date)
        due_date += 1.month
      end
      @recurring_operation.save
    end

    private

    def add_recurring_operation(date)
      @recurring_operation.operations.new(
        name: @recurring_operation.name,
        value: @recurring_operation.value,
        date_of_operation: calculate_due_date(date),
        operation_type: @recurring_operation.operation_type,
        user: @user
      )
    end

    def calculate_due_date(date)
      temp_date = date.change({ day: @recurring_operation.starts_in.day })
      if temp_date.month == date.month
        temp_date
      else
        due_date.end_of_month
      end
    end
  end
end
