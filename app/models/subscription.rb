# frozen_string_literal: true

class Subscription < ApplicationRecord
  FREQUENCIES = [
    WEEKLY = "weekly",
    BI_MONTHLY = "bi_monthly",
    MONTHLY = "monthly",
    CUSTOM = "custom"
  ].freeze

  belongs_to :user, optional: false
  has_many :basket_subscriptions
  has_many :baskets, through: :basket_subscriptions

  validates :frequency, :start_date, presence: true
  validates :frequency, inclusion: { in: FREQUENCIES }

  validate :end_date_cannot_be_before_start_date

  before_validation :enforce_start_date

  private

  def end_date_cannot_be_before_start_date
    return unless end_date.present? && start_date.present?
    return unless end_date < start_date

    errors.add(:end_date, "cannot be before start_date")
  end

  def enforce_start_date
    return if start_date.present?

    self.start_date = Time.current
  end
end

# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  frequency  :string           not null
#  start_date :date             not null
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_subscriptions_on_user_id  (user_id)
#
