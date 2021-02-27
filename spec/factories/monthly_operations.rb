FactoryBot.define do
  factory :monthly_operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    date_of_operation { Faker::Date.between(from: 2.year.ago, to: 2.year.from_now).to_date }
    operation_type { rand(0..1) }
  end
end
