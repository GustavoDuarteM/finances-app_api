# frozen_string_literal: true

module Api
  module V1
    class RecurringOperationsController < ApplicationController
      before_action :authorize_access_request!

      include RecurringOperationManager

      before_action :set_recurring_operation, only: %i[show destroy update]
      before_action :recurring_operation_params, only: %i[create update]
      before_action :not_found_recurring_operation, only: %i[show destroy update], if: lambda {
                                                                                         @recurring_operation.blank?
                                                                                       }
      def show
        render json: @recurring_operation
      end

      def create
        @recurring_operation = current_user.recurring_operations.new(recurring_operation_params)
        if RecurringOperationCreator.new(@recurring_operation).call
          render json: @recurring_operation, status: :created
        else
          render json: @recurring_operation.errors, status: :unprocessable_entity
        end
      end

      def update
        if @recurring_operation.update(recurring_operation_params)
          render json: @recurring_operation
        else
          render json: @recurring_operation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @recurring_operation.destroy
          render json: nil, status: :ok
        else
          render json: @recurring_operation.errors, status: :unprocessable_entity
        end
      end

      def not_found_recurring_operation
        render json: nil, status: :not_found
      end

      private

      def recurring_operation_params
        params.require(:recurring_operation).permit(
          :name,
          :value,
          :starts_in,
          :ends_in,
          :operations_flow,
          :operations_frequency
        )
      end

      def set_recurring_operation
        @recurring_operation = current_user.recurring_operations.where(id: params[:id]).first
      end
    end
  end
end
