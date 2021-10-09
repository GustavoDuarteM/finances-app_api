# frozen_string_literal: true

module ControllerMacros
  def login_user
    before :each do
      @user = create(:user)
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      access_tokens = session.login[:access]
      request.headers['Authorization'] = "Bearer #{access_tokens}"
    end
  end
end
