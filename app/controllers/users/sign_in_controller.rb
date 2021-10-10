# frozen_string_literal: true

module Users
  class SignInController < ApplicationController
    before_action :authorize_access_request!, only: %i[destroy]

    def create
      user = User.where(email: user_params[:email]).first
      if user&.authenticate(user_params[:password])
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        render json: { jwt: session.login[:access] }
      else
        render json: 'Invalid email or password', status: :unauthorized
      end
    end

    def destroy
      session = JWTSessions::Session.new(payload: payload)
      session.flush_by_access_payload
      render json: {}
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
