# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::SignUps', type: :request do
  describe 'User Sign Up' do
    let(:password) { Faker::Internet.password }
    let(:password_confirmation) { password }
    let(:email) { Faker::Internet.email }
    let(:user) do
      {
        email: email,
        name: Faker::Commerce.product_name,
        password: password,
        password_confirmation: password_confirmation
      }
    end

    subject { post '/users/sign_up', params: user }

    context 'when fill correctly user data ' do
      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not correctly filling in the user data' do
      context 'and send email password ' do
        let(:email) { Faker::Alphanumeric.alphanumeric(number: 10) }
        it 'returns http unprocessable entity' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'and send invalid password confirmation' do
        let(:password_confirmation) { '' }
        it 'returns http unprocessable entity' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
