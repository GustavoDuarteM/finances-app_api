require 'rails_helper'

RSpec.describe "Api::V1::RecurringOperation", type: :request do
  it "Creates a RecurringOperation" do
    recurring_operation = build(:recurring_operation).attributes
    post "/api/v1/recurring_operations", params: { recurring_operation: recurring_operation }
    expect(response).to have_http_status(:created)
  end

  it "Show a RecurringOperation" do
    recurring_operation = create(:recurring_operation)
    get "/api/v1/recurring_operations/#{recurring_operation.id}"
    expect(response).to have_http_status(:ok)
  end

  it "Update a RecurringOperation" do
    recurring_operation = create(:recurring_operation)
    new_attributes_for_recurring_operation = build(:recurring_operation).attributes
    put "/api/v1/recurring_operations/#{recurring_operation.id}", params: { recurring_operation: new_attributes_for_recurring_operation }
    expect(response).to have_http_status(:ok)
  end   

  it "Delete a RecurringOperation" do
    recurring_operation = create(:recurring_operation)
    delete "/api/v1/recurring_operations/#{recurring_operation.id}"
    expect(response).to have_http_status(:ok)
  end
end
