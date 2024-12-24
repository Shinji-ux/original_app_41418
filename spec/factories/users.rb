FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    company {Faker::Company.name}
    phone {Faker::Number.leading_zero_number(digits: 11)}    
  end
end
