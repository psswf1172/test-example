FactoryGirl.define do
  factory :topping do
    release_month Faker::Time.between(DateTime.now - 5.months, DateTime.now + 5.months)
    association :add_on, strategy: :build
  end
end