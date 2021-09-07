# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Operations', type: :request do
  describe 'Authenticate user' do
    login_user

    it 'Creates a Operations' do
      operation = build(:operation, user: nil).attributes
      post '/api/v1/operations', params: { operation: operation }, headers: @token
      expect(response).to have_http_status(:created)
    end

    describe 'when requesting RecurringOperation existent' do
      it 'Show a Operations' do
        operation = create(:operation, user: @user)
        get "/api/v1/operations/#{operation.id}", headers: @token
        expect(response).to have_http_status(:ok)
      end

      it 'Update a Operations' do
        operation = create(:operation, user: @user)
        new_attributes_for_operation = build(:operation).attributes
        put "/api/v1/operations/#{operation.id}",
            params: { operation: new_attributes_for_operation }, headers: @token
        expect(response).to have_http_status(:ok)
      end

      it 'Delete a Operations' do
        operation = create(:operation, user: @user)
        delete "/api/v1/operations/#{operation.id}", headers: @token
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'when requesting RecurringOperation nonexistent' do
      it 'Show a Operations' do
        operation = create(:operation)
        get "/api/v1/operations/#{operation.id}", headers: @token
        expect(response).to have_http_status(:not_found)
      end

      it 'Update a Operations' do
        operation = create(:operation)
        new_attributes_for_operation = build(:operation).attributes
        put "/api/v1/operations/#{operation.id}",
            params: { operation: new_attributes_for_operation }, headers: @token
        expect(response).to have_http_status(:not_found)
      end

      it 'Delete a Operations' do
        operation = create(:operation)
        delete "/api/v1/operations/#{operation.id}", headers: @token
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  describe 'Unauthenticate user' do
    it 'Creates a Operations' do
      operation = build(:operation, user: nil).attributes
      post '/api/v1/operations', params: { operation: operation }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Show a Operations' do
      operation = create(:operation)
      get "/api/v1/operations/#{operation.id}"
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Update a Operations' do
      operation = create(:operation)
      new_attributes_for_operation = build(:operation).attributes
      put "/api/v1/operations/#{operation.id}",
          params: { operation: new_attributes_for_operation }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'Delete a Operations' do
      operation = create(:operation)
      delete "/api/v1/operations/#{operation.id}"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
