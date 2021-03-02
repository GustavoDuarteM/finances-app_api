FactoryBot.define do
  factory :user do
    email { Faker::Internet.email  }
    name { Faker::Commerce.product_name }
    image_url { Faker::Avatar.image }
    uid { Faker::Internet.uuid }
    token { Faker::Alphanumeric.alpha(number: 163) }
    refresh_token { Faker::Alphanumeric.alpha(number: 103) }
    expires_at { rand(10000..9999999) }
    expires { Faker::Boolean.boolean }
  end
end
