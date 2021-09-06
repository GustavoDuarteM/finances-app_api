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

class User < ApplicationRecord
  has_secure_password

  has_many :recurring_operations
  has_many :operations

  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end
