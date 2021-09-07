# frozen_string_literal: true

module Api
  module V1
    class OperationsController < ApplicationController
      before_action :authorize_access_request!

      before_action :set_operation, only: %i[show destroy update]
      before_action :operation_params, only: %i[create update]
      before_action :not_found_operation, only: %i[show destroy update], if: -> { @operation.blank? }

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

      def not_found_operation
        render json: nil, status: :not_found
      end

      def operation_params
        params.require(:operation).permit(
          :name,
          :value,
          :date_of_operation,
          :operation_flow
        )
      end

      def set_operation
        @operation = current_user.operations.where(id: params[:id]).first
      end
    end
  end
end
