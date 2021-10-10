# frozen_string_literal: true

module Users
  class SignUpController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        render json: { jwt: session.login[:access] }
      else
        render json: { error: user.errors.full_messages.join(' ,') }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
