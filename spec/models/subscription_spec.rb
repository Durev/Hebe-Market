# frozen_string_literal: true

RSpec.describe Subscription, type: :model do
  subject { FactoryBot.build(:subscription) }

  it { is_expected.to have_many(:basket_subscriptions) }
  it { is_expected.to have_many(:baskets) }
  it { is_expected.to belong_to(:user) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "@user" do
    it "is required" do
      subject.user = nil
      expect(subject).to have(1).error_on(:user)

      subject.user = FactoryBot.build(:user)
      expect(subject).to have(:no).error_on(:user)
    end
  end

  describe "@frequency" do
    it "is included in the valid frequencies" do
      subject.frequency = "daily"
      expect(subject).to have(1).error_on(:frequency)

      subject.frequency = Subscription::MONTHLY
      expect(subject).to have(:no).error_on(:frequency)
    end
  end

  describe "@end_date" do
    it "is after start_date" do
      subject.end_date = 2.days.ago
      expect(subject).to have(1).error_on(:end_date)

      subject.end_date = 2.weeks.from_now
      expect(subject).to have(:no).error_on(:end_date)
    end
  end
end
