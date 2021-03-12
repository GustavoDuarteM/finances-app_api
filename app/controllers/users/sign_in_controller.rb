class Users::SignInController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    
    user = User.where(email: params[:email], uid: params[:uid]).first
    if user.present?

      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)

      render json: { csrf: tokens[:csrf] }
    else
      render json: "Invalid email or password", status: :unauthorized
    end
  end
  private

  def not_found_user
    render json: :not_found
  end
end
