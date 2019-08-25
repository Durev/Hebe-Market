# frozen_string_literal: true

class Basket < ApplicationRecord
  BASKET_TYPES = [
    DEFAULT_TYPE = "default",
    CUSTOM_TYPE = "custom"
  ].freeze

  validates :basket_type, :price, presence: true
  validates :basket_type, inclusion: { in: BASKET_TYPES }
  validates :price, numericality: { greater_than: 0 }
end
