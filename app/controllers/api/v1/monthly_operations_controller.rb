class Api::V1::MonthlyOperationsController < ApiApplicationController
  before_action :set_monthly_operation, only: [:show, :destroy, :update]
  before_action :monthly_operation_params, only: [:create, :update]
  before_action :not_found_monthly_operation, only: [:show, :destroy, :update], if: -> { @monthly_operation.blank? }

  def show
    render json: @monthly_operation
  end

  def create
    @monthly_operation = @user.monthly_operations.new(monthly_operation_params)
    if @monthly_operation.save
      render json: @monthly_operation, status: :created
    else
      render json: @monthly_operation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @monthly_operation.update(monthly_operation_params)
      render json: @monthly_operation
    else
      render json: @monthly_operation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @monthly_operation.destroy
      render json: nil, status: :ok
    else
      render json: @monthly_operation.errors, status: :unprocessable_entity
    end
  end

  private

  def not_found_monthly_operation
    render json: nil, status: :not_found
  end

  def monthly_operation_params
    params.require(:monthly_operation).permit(
      :name,
      :value,
      :date_of_operation,
      :operation_type
    )
  end

  def set_monthly_operation
    @monthly_operation = @user.monthly_operations.where(id: params[:id]).first
  end
end
