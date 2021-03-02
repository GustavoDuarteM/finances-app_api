# Table: users
# id:              integer
# email:           string
# uid:             string
# name:            string
# image_url:       string
# token:           string
# expires_at:      integer
# refresh_token:   string
# expires:         boolean
# created_at:      datetime
# updated_at:      datetime

class User < ApplicationRecord
  devise :trackable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, :email, :uid, presence: true
end
