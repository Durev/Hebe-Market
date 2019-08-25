# frozen_string_literal: true

class Subscription < ApplicationRecord
  FREQUENCIES = [
    WEEKLY = "weekly",
    BI_MONTHLY = "bi_monthly",
    MONTHLY = "monthly",
    CUSTOM = "custom"
  ].freeze

  belongs_to :user, optional: false
  belongs_to :basket, optional: false

  validates :quantity, :frequency, presence: true
  validates :frequency, inclusion: { in: FREQUENCIES }
  validates :quantity, numericality: { greater_than: 0 }

  validate :end_date_cannot_be_in_the_past

  private

  def end_date_cannot_be_in_the_past
    return unless end_date.present? && end_date < Time.zone.today

    errors.add(:end_date, "can't be in the past")
  end
end
