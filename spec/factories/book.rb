# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    year { Faker::Date.backward(days: 1000).year }
    quantity { Faker::Number.within(range: 1..100) }
  end
end
