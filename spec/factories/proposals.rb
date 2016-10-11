FactoryGirl.define do
  factory :proposal do
    user
    walker
    days 'Segunda-feira'
    hours 'Tarde'
    dogs Faker::Name.first_name
    gang "Individual"
    observation Faker::Hacker.say_something_smart
    location Faker::Address.street_name
    status Faker::Number.between(0, 2)
  end
end
