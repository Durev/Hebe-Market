# frozen_string_literal: true

FactoryBot.define do
  factory :basket_subscription do
    basket
    subscription
    quantity { 2 }
  end
end
