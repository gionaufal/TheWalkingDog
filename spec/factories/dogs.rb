FactoryGirl.define do
  factory :dog do
    name "MyString"
    age "MyString"
    size "MyString"
    race "MyString"
    personality "MyString"
    avatar { File.new("#{Rails.root}/spec/support/fixtures/Dogs-Bite.jpg") }
  end
end
