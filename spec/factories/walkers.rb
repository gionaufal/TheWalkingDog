FactoryGirl.define do
  factory :walker do
    sequence :name do
      Faker::Name.name
    end
    sequence :age do
      Faker::Number.between(18, 43)
    end
    sequence :address do
      Faker::Address.street_name
    end
    region 'Centro'
    sequence :cpf do
      Faker::Number.number(11)
    end
    sequence :bio do
      Faker::Hacker.say_something_smart
    end
    sequence :experience do
      Faker::Hacker.say_something_smart
    end
    sequence :price do
      Faker::Number.between(50, 300)
    end
    sequence :email do |n|
      "walker#{n}@example.com"
    end
    phone '1211412'
    password '12345678'
  end
end
