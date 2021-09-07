# frozen_string_literal: true

FactoryBot.define do
  factory :recurring_operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    starts_in { Faker::Date.between(from: 2.year.ago, to: DateTime.now).to_date }
    ends_in { Faker::Date.between(from: 1.month.from_now, to: 2.year.from_now).to_date }
    operations_flow { rand(0..1) }
    operations_frequency { 1 }
    association :user, factory: :user
  end
end
