# frozen_string_literal: true

FactoryBot.define do
  factory :single_operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    date_of_operation { Faker::Date.between(from: 2.year.ago, to: DateTime.now).to_date }
    operation_type { rand(0..1) }
    association :user, factory: :user
  end
end
