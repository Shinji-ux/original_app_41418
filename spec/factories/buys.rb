FactoryBot.define do
  factory :buy do
    transaction_date {Faker::Date.birthday}
    association :user
    association :supplier
  end
end
