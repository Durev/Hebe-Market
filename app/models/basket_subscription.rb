# frozen_string_literal: true

class BasketSubscription < ApplicationRecord
  belongs_to :basket, optional: false
  belongs_to :subscription, optional: false
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end

# == Schema Information
#
# Table name: basket_subscriptions
#
#  id              :bigint           not null, primary key
#  basket_id       :bigint           not null
#  subscription_id :bigint           not null
#  quantity        :integer          default(1), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_basket_subscriptions_on_basket_id        (basket_id)
#  index_basket_subscriptions_on_subscription_id  (subscription_id)
#
