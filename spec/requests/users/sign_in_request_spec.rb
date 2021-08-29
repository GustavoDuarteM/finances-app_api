# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::SignIns', type: :request do
  describe 'User sign in' do
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    let(:user_params) { { email: email, password: password } }

    subject { post '/users/sign_in', params: user_params }

    before do
      create(:user, email: email, password: password)
    end

    context 'when a valid user' do
      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not a valid user' do
      let(:user_params) do
        {
          email: Faker::Internet.email,
          password: Faker::Internet.password
        }
      end
      it 'returns http unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
