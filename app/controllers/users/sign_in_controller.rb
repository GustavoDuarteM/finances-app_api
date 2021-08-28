# frozen_string_literal: true

module Users
  class SignInController < ApplicationController
    def create
      user = User.where(email: user_params[:email]).first
      if user&.authenticate(user_params[:password])
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload)
        render json: { jwt: session.login[:access] }
      else
        render json: 'Invalid email or password', status: :unauthorized
      end
    end

    def user_params
      params.permit(:email, :password)
    end
  end
end
