FactoryGirl.define do
  factory :user do
    sequence(:full_name) {|n| "thek_#{n}"}
    sequence(:email) {|n| "thek_#{n}@thek.com"}
    password "password"
  end
end
