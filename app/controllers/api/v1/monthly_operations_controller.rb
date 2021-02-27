class Api::V1::MonthlyOperationsController < ApplicationController
  before_action :set_monthly_operation, only: [:show, :destroy, :update]
  before_action :monthly_operation_params, only: [:create, :update]
  skip_before_action :verify_authenticity_token, only: [:create, :destroy, :update]

  def show
    respond_to do |format|
      if @monthly_operation.present?
        format.json { render json: @monthly_operation, status: :ok }
      else
        format.json { render json: {}, status: :not_found }
      end
    end
  end

  def create
    @monthly_operation = MonthlyOperation.new(monthly_operation_params)
    respond_to do |format|
      if @monthly_operation.save
        format.json { render json: @monthly_operation, status: :created }
      else
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @monthly_operation.present? && @monthly_operation.update(monthly_operation_params)
        format.json { render json: @monthly_operation, status: :ok }
      else
        format.json { render json: {}, status: :not_found }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @monthly_operation.present? && @monthly_operation.destroy
        format.json { render json: {}, status: :ok }
      else
        format.json { render json: {}, status: :not_found }
      end
    end
  end

  def monthly_operation_params
    params.require(:monthly_operation).permit(
      :name,
      :value,
      :date_of_operation,
      :operation_type
    )
  end

  private

  def set_monthly_operation
    @monthly_operation = MonthlyOperation.where(id: params[:id]).first
  end
end
