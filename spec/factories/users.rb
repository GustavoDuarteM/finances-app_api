# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Commerce.product_name }
    password { Faker::Internet.password }
    token { Faker::Alphanumeric.alpha(number: 163) }
    refresh_token { Faker::Alphanumeric.alpha(number: 103) }
    expires_at { rand(10_000..9_999_999) }
    expires { Faker::Boolean.boolean }
  end
end
