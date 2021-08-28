# frozen_string_literal: true

# Table: users
# id:              integer
# email:           string
# name:            string
# token:           string
# expires_at:      integer
# refresh_token:   string
# expires:         boolean
# created_at:      datetime
# updated_at:      datetime

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

  it 'Is invalid without password ' do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end
end
