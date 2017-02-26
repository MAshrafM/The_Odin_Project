FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
  end
end