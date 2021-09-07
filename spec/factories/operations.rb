# frozen_string_literal: true

FactoryBot.define do
  factory :operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    date_of_operation { Faker::Date.between(from: 2.year.ago, to: 2.year.from_now).to_date }
    operation_flow { rand(0..1) }
    association :user, factory: :user
  end
end
