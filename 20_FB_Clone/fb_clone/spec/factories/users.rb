FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {|u| "#{u.name.gsub(/[^a-zA-Z1-10]/, '')}_#{u.last_name.gsub(/[^a-zA-Z1-10]/, '')}_#{Random.rand(1000).to_s}@factory.com"}
    password {Faker::Internet.password}
  end
  
  factory :another_user, class: User do
    name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {|u| "#{u.name.gsub(/[^a-zA-Z1-10]/, '')}_#{u.last_name.gsub(/[^a-zA-Z1-10]/, '')}_#{Random.rand(1000).to_s}@factory.com"}
    password {Faker::Internet.password}
  end
end