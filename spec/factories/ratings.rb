FactoryGirl.define do
  factory :rating do
    value 10
    movie
    user
  end
end
