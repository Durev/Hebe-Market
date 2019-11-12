# frozen_string_literal: true

RSpec.describe BasketSubscription, type: :model do
  subject { FactoryBot.build(:basket_subscription) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "@basket" do
    it "is required" do
      subject.basket = nil
      expect(subject).to have(1).error_on(:basket)

      subject.basket = FactoryBot.build(:basket)
      expect(subject).to have(:no).error_on(:basket)
    end
  end

  describe "@subscription" do
    it "is required" do
      subject.subscription = nil
      expect(subject).to have(1).error_on(:subscription)

      subject.subscription = FactoryBot.build(:subscription)
      expect(subject).to have(:no).error_on(:subscription)
    end
  end

  describe "@quantity" do
    it "is required" do
      subject.quantity = nil
      expect(subject).to have_at_least(1).error_on(:quantity)

      subject.quantity = 2
      expect(subject).to have(:no).error_on(:quantity)
    end

    it "is a positive integer" do
      subject.quantity = 0
      expect(subject).to have(1).error_on(:quantity)

      subject.quantity = 2
      expect(subject).to have(:no).error_on(:quantity)
    end
  end
end
