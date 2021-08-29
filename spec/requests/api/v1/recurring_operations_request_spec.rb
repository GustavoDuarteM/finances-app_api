# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::RecurringOperation', type: :request do
  describe 'Authenticate user' do
    login_user

    it 'Creates a RecurringOperation' do
      recurring_operation = build(:recurring_operation, user: nil).attributes
      post '/api/v1/recurring_operations', params: { recurring_operation: recurring_operation }, headers: @token
      expect(response).to have_http_status(:created)
    end
    describe 'when requesting RecurringOperation existent' do
      it 'Show a RecurringOperation' do
        recurring_operation = create(:recurring_operation, user: @user)
        get "/api/v1/recurring_operations/#{recurring_operation.id}", headers: @token
        expect(response).to have_http_status(:ok)
      end

      it 'Update a RecurringOperation' do
        recurring_operation = create(:recurring_operation, user: @user)
        new_attributes_for_recurring_operation = build(:recurring_operation, user: nil).attributes
        put "/api/v1/recurring_operations/#{recurring_operation.id}",
            params: { recurring_operation: new_attributes_for_recurring_operation }, headers: @token
        expect(response).to have_http_status(:ok)
      end

      it 'Delete a RecurringOperation' do
        recurring_operation = create(:recurring_operation, user: @user)
        delete "/api/v1/recurring_operations/#{recurring_operation.id}", headers: @token
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'when requesting RecurringOperation nonexistent' do
      it 'Show a RecurringOperation' do
        recurring_operation = create(:recurring_operation)
        get "/api/v1/recurring_operations/#{recurring_operation.id}", headers: @token
        expect(response).to have_http_status(:not_found)
      end

      it 'Update a RecurringOperation' do
        recurring_operation = create(:recurring_operation)
        new_attributes_for_recurring_operation = build(:recurring_operation, user: nil).attributes
        put "/api/v1/recurring_operations/#{recurring_operation.id}",
            params: { recurring_operation: new_attributes_for_recurring_operation }, headers: @token
        expect(response).to have_http_status(:not_found)
      end

      it 'Delete a RecurringOperation' do
        recurring_operation = create(:recurring_operation)
        delete "/api/v1/recurring_operations/#{recurring_operation.id}", headers: @token
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  describe 'Unauthenticate user' do
    it 'Creates a RecurringOperation' do
      recurring_operation = build(:recurring_operation, user: nil).attributes
      post '/api/v1/recurring_operations', params: { recurring_operation: recurring_operation }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Show a RecurringOperation' do
      recurring_operation = create(:recurring_operation)
      get "/api/v1/recurring_operations/#{recurring_operation.id}"
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Update a RecurringOperation' do
      recurring_operation = create(:recurring_operation)
      new_attributes_for_recurring_operation = build(:recurring_operation, user: nil).attributes
      put "/api/v1/recurring_operations/#{recurring_operation.id}",
          params: { recurring_operation: new_attributes_for_recurring_operation }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Delete a RecurringOperation' do
      recurring_operation = create(:recurring_operation)
      delete "/api/v1/recurring_operations/#{recurring_operation.id}"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
