module ControllerMacros
  def login_user
    before :each do
      user = create(:user)
      sign_in user
    end
  end

  def auth_token
    before :each do
      user = create(:user)
      @token = { 'Authorization': "Bearer #{ user.token }" }
    end
  end
end