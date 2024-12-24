FactoryBot.define do
  factory :category do
    category {Faker::Lorem.sentence}
    association :user
  end
end
