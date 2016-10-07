FactoryGirl.define do
  factory :proposal do
    user
    walker
    datetime Faker::Time.forward(23, :all)
    dogs Faker::Name.first_name
    gang "Individual"
    observation Faker::Hacker.say_something_smart
    location Faker::Address.street_name
    status Faker::Number.between(0, 2) 
  end
end
