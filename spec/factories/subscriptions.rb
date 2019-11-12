# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user

    frequency { Subscription::FREQUENCIES.sample }
    start_date { 1.week.from_now }
  end
end
