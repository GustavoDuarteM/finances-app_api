# frozen_string_literal: true

module Api
  module V1
    class TotalOperationsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_operations, only: %i[index]

      def index
        inflow = @operations.sum_operation(flow: 'inflow')
        outflow = @operations.sum_operation(flow: 'outflow')
        total = (inflow - outflow)
        render json: {
          month: Date.today.strftime('%m'),
          inflow: inflow,
          outflow: outflow,
          total: total,
          total_flow: total >= 0 ? 'inflow' : 'outflow'
        }
      end

      private

      def set_operations
        @operations = current_user.operations
        @operations = @operations.operations_between_date(
          start_in: Date.today.beginning_of_month,
          end_in: Date.today.end_of_month
        )
      end
    end
  end
end
