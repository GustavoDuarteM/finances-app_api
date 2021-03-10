class Api::V1::RecurringOperationsController < ApplicationController
  include RecurringOperationManager

  before_action :set_recurring_operation, only: [:show, :destroy, :update]
  before_action :recurring_operation_params, only: [:create, :update]
  before_action :not_found_recurring_operation, only: [:show, :destroy, :update], if: -> { @recurring_operation.blank? }

  def show
    render json: @recurring_operation
  end

  def create
    @recurring_operation = @user.recurring_operations.new(recurring_operation_params)
    if RecurringOperationCreator.call(@recurring_operation)
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
      :operation_type
    )
  end

  def set_recurring_operation
    @recurring_operation = @user.recurring_operations.where(id: params[:id]).first
  end
end
