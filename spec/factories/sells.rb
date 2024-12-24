FactoryBot.define do
  factory :sell do
    transaction_date {Faker::Date.birthday}
    total_price {Faker::Number.between(from: 300, to: 30000)}
    association :user
    association :customer
  end
end
