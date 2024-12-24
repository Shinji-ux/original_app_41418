FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    unit {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 30000)}
    association :user
    association :category
  end
end
