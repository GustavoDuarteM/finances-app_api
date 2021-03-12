require 'rails_helper'

RSpec.describe "Users::SignIns", type: :request do

  describe "User sign in" do
    it "returns http success" do
      user = create(:user)
      post "/users/sign_in" , params: { email: user.email, uid: user.uid }
      expect(response).to have_http_status(:success)
      expect(cookies[:jwt_access]).to_not eq nil
    end
  end

end
