# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OperationsController, type: :controller do
  describe 'GET #index' do

    subject do
      get :index
    end

    context 'when authenticated' do
      login_user
      context 'when operation existe' do
        it 'return http status 200' do
          create_list(:operation, 10, user: @user)
          subject
          expect(response).to have_http_status(:ok)
        end

        it 'return  list' do
          create_list(:operation, 10, user: @user)
          subject
          expect(response.body).not_to eq('{}')
        end
      end

      context 'when operations not has operation' do
        let(:operation) { build(:operation, id: 0) }

        it 'return http status 200' do
          create_list(:operation, 10)
          subject
          expect(response).to have_http_status(:ok)
        end

        it 'return empty list' do
          create_list(:operation, 10)
          subject
          expect(response.body).to eq('{}')
        end
      end
    end

    context 'when unauthenticate user' do
      let(:operation) { create(:operation) }
      it 'return http status unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  describe 'GET #show' do
    let(:operation) { create(:operation, user: @user) }

    subject do
      get :show, params: { id: operation }
    end

    context 'when authenticated' do
      login_user

      it 'return http status ok' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'return operation created' do
        subject
        body = JSON.parse(response.body)
        expect(body).to include(
          'name' => operation.name,
          'value' => operation.value,
          'operation_flow' => operation.operation_flow
        )
      end
    end

    context 'when unauthenticate user' do
      let(:operation) { create(:operation) }

      it 'return http status unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    let(:operation) { build(:operation, user: nil).attributes }

    subject do
      post :create, params: operation
    end

    context 'when authenticated' do
      login_user

      it 'return http status created' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'return operation created' do
        subject
        body = JSON.parse(response.body)
        expect(body).to include(
          'name' => operation['name'],
          'value' => operation['value'],
          'operation_flow' => operation['operation_flow']
        )
      end
    end

    context 'when unauthenticate user' do
      it 'return http status unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #update' do
    let(:operation) { {} }
    let(:new_attributes_for_operation) { build(:operation, id: operation.id).attributes }

    subject do
      patch :update, params: new_attributes_for_operation
    end

    context 'when authenticated' do
      login_user
      let(:operation) { create(:operation, user: @user) }
      context 'when operation existe' do
        it 'return http status 200' do
          subject
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when operation not existe' do
        let(:operation) { build(:operation, id: 0) }

        it 'return http status 200' do
          subject
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    context 'when unauthenticate user' do
      let(:operation) { create(:operation) }
      it 'return http status unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE  #destroy' do
    let(:operation) { {} }

    subject do
      delete :destroy, params: { id: operation.id }
    end

    context 'when authenticated' do
      login_user
      context 'when operation existe' do
        let(:operation) { create(:operation, user: @user) }

        it 'return http status 200' do
          subject
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when operation not existe' do
        let(:operation) { build(:operation, id: 0) }

        it 'return http status 200' do
          subject
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    context 'when unauthenticate user' do
      let(:operation) { create(:operation) }
      it 'return http status unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
