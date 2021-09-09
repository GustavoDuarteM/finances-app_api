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

  %i[name email password].each do |atribute|
    it "Is invalid without #{atribute}" do
      user = build(:user, "#{atribute}": nil)
      expect(user).to_not be_valid
    end
  end
end
