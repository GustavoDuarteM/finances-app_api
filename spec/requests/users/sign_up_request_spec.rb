require 'rails_helper'

RSpec.describe "Users::SignUps", type: :request do

  describe "User Sign Up" do
    it "returns http success" do
      post "/users/sign_up", params: build(:user).attributes.slice('email', 'name', 'uid')
      expect(response).to have_http_status(:success)
      expect(cookies[:jwt_access]).to_not eq nil
    end
  end

end
