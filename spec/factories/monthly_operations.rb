FactoryBot.define do
  factory :monthly_operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    date_of_operation { Faker::Date.between(from: 2.days.ago, to: 2.days.from_now).to_date }
    type { rand(0..1) }
  end
end
