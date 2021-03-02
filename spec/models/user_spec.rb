require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'Is valid with valid attributes' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'Is invalid without name ' do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'Is invalid without email ' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'Is invalid without uid ' do
    user = build(:user, uid: nil)
    expect(user).to_not be_valid
  end
end
