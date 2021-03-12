require 'rails_helper'

RSpec.describe "Users::Refreshes", type: :request do
  describe "Refress auth token" do
    it "returns http success" do
      user = create(:user)
      post "/users/sign_in" , params: { email: user.email, uid: user.uid }
      csrf,token = response.body.gsub(/\{|}|"/,'').split(':')
      headers = {"#{csrf}": token}
      headers.merge!({ 'Authorization': "Bearer #{ response.cookies['jwt_access'] }" })
      post "/users/refresh" , headers: headers
      expect(response).to have_http_status(:success)
      expect(cookies[:jwt_access]).to_not eq nil
    end
  end

end
