# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user
    basket

    frequency { Subscription::FREQUENCIES.sample }
    quantity { rand(1..100) }
  end
end
