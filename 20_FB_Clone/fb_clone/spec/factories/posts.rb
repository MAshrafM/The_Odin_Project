FactoryGirl.define do
  factory :post do
    body {Faker::Lorem.characters(100)}
  end
end