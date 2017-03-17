FactoryGirl.define do
  factory :event do
    name              { Faker::ChuckNorris.fact }
    description       { Faker::Hipster.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          50
    includes_food     true
    includes_drinks   false
    starts_at         10.days.from_now
    ends_at           11.days.from_now
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
