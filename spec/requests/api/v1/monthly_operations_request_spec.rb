require 'rails_helper'

RSpec.describe "Api::V1::MonthlyOperations", type: :request do
  it "Creates a MonthlyOperations" do
    monthly_operation = build(:monthly_operation).attributes
    post "/api/v1/monthly_operations", params: { monthly_operation: monthly_operation }
    expect(response).to have_http_status(:created)
  end

  it "Show a MonthlyOperations" do
    monthly_operation = create(:monthly_operation)
    get "/api/v1/monthly_operations/#{monthly_operation.id}"
    expect(response).to have_http_status(:ok)
  end

  it "Update a MonthlyOperations" do
    monthly_operation = create(:monthly_operation)
    new_attributes_for_monthly_operation = build(:monthly_operation).attributes
    put "/api/v1/monthly_operations/#{monthly_operation.id}", params: { monthly_operation: new_attributes_for_monthly_operation }
    expect(response).to have_http_status(:ok)
  end   

  it "Delete a MonthlyOperations" do
    monthly_operation = create(:monthly_operation)
    delete "/api/v1/monthly_operations/#{monthly_operation.id}"
    expect(response).to have_http_status(:ok)
  end

end
