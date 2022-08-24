# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle.titleize }
    phone { Faker::PhoneNumber.phone_number }

    trait :with_loan do
      association :loan
    end
  end
end
