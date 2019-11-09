# frozen_string_literal: true

class Basket < ApplicationRecord
  BASKET_TYPES = [
    DEFAULT_TYPE = "default",
    CUSTOM_TYPE = "custom"
  ].freeze

  has_many :subscriptions, through: :basket_subscriptions

  validates :basket_type, :price, presence: true
  validates :basket_type, inclusion: { in: BASKET_TYPES }
  validates :price, numericality: { greater_than: 0 }
end

# == Schema Information
#
# Table name: baskets
#
#  id          :bigint           not null, primary key
#  basket_type :string           default("default"), not null
#  content     :text
#  price       :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
