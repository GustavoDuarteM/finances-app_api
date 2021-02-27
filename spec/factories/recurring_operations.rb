FactoryBot.define do
  factory :recurring_operation do
    name { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    starts_in { Faker::Date.between(from: 2.year.ago, to: DateTime.now).to_date }
    ends_in { Faker::Date.between(from: 1.month.from_now, to: 2.year.from_now).to_date }
    operation_type { rand(0..1) }
  end
  
  factory :recurring_operation_with_monthly_operation do
    after(:create) do |recurring_operation|
      create_list(:monthly_operation, rand(1...20), recurring_operation: recurring_operation)
    end
  end
end
