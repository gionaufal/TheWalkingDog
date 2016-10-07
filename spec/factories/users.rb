FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    address 'Rua dos bobos, 0'
    cpf '09495966600'
    sequence :email do |n|
      "person#{n}@example.com"
    end
    phone '11958684444'
    password 'senha123'
  end
end
