FactoryBot.define do
  factory :supplier do
    company {Faker::Company.name}
    phone {Faker::Number.leading_zero_number(digits: 11)}
    association :user
  end
end
