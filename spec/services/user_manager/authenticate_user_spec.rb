require 'rails_helper'

RSpec.describe UserManager::AuthenticateUser, type: :model do
  it "#call" do
    user = create(:user)
    headers = {}
    headers['authorization'] = user.token
    result = UserManager::AuthenticateUser.call(headers)
    expect(result).to eq(user)
  end
end