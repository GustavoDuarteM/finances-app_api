# frozen_string_literal: true

module Api
  module V1
    class OperationsController < ApplicationController
      before_action :authorize_access_request!

      before_action :set_operation, only: %i[show destroy update]
      before_action :filter_params, only: %i[index]
      before_action :page_params, only: %i[index]
      before_action :set_operations, only: %i[index]
      before_action :not_found, only: %i[show destroy update], if: -> { @operation.blank? }

      def index
        render json: @operations
      end

      def show
        render json: @operation
      end

      def create
        @operation = current_user.operations.new(operation_params)
        if @operation.save
          render json: @operation, status: :created
        else
          render json: @operation.errors, status: :unprocessable_entity
        end
      end

      def update
        if @operation.update(operation_params)
          render json: @operation
        else
          render json: @operation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @operation.destroy
          render json: nil, status: :ok
        else
          render json: @operation.errors, status: :unprocessable_entity
        end
      end

      private

      def operation_params
        params.permit(
          :name,
          :value,
          :date_of_operation,
          :operation_flow
        )
      end

      def page_params
        params.permit(
          :page
        )
      end

      def filter_params
        params.permit(
          :start_in,
          :end_in,
          :operation_flow,
          :group_by_date
        )
      end

      def set_operation
        @operation = current_user.operations.where(id: params[:id]).first
      end

      def set_operations
        @operations = current_user.operations
        @operations = filter_date_of_operation
        @operations = filter_operation_flow
        @operations = @operations.order_by_date_of_operation
                                 .page(page_params[:page].to_i)
        @operations = group_by_date
      end

      def filter_date_of_operation
        start_in = filter_params[:start_in]
        end_in = filter_params[:end_in]

        return @operations.operations_until_current_month unless start_in && end_in

        return @operations.operations_start_in(start_in) if start_in && end_in.blank?

        @operations.operations_between_date(start_in, end_in) if start_in && end_in
      end

      def filter_operation_flow
        operation_flow = filter_params[:operation_flow]
        return @operations unless operation_flow

        @operations.where(operation_flow: operation_flow)
      end

      def group_by_date
        return @operations if filter_params[:group_by_date] != 'true'

        @operations.group_by_date_of_operation
      end
    end
  end
end
