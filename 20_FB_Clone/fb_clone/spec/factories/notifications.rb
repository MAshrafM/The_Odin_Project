FactoryGirl.define do
  factory :notification do
    title {friend_request}
    body {User want to be friends with you}
  end
end