# frozen_string_literal: true

class Basket < ApplicationRecord
  BASKET_TYPES = [
    DEFAULT = "default",
    CUSTOM = "custom"
  ].freeze

  validates :basket_type, :price, presence: true
  validates :price, numericality: true
end
