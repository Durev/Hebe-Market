# frozen_string_literal: true

FactoryBot.define do
  factory :basket do
    basket_type { Basket::BASKET_TYPES.sample }
    price { Faker::Number.positive }
  end
end
