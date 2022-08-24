# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
    due_date { Faker::Date.forward(days: 30) }
    status { :created }
    association :user
    association :book
  end
end
