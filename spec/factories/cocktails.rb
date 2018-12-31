# frozen_string_literal: true

FactoryBot.define do
  factory :cocktail do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
