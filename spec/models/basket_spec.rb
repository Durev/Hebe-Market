# frozen_string_literal: true

RSpec.describe Basket, type: :model do
  subject { FactoryBot.build(:basket) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "@basket_type" do
    it "is required" do
      subject.basket_type = nil
      expect(subject).to have_at_least(1).error_on(:basket_type)

      subject.basket_type = Basket::DEFAULT_TYPE
      expect(subject).to have(:no).error_on(:basket_type)
    end

    it "is a valid type" do
      subject.basket_type = "random"
      expect(subject).to have(1).error_on(:basket_type)

      subject.basket_type = Basket::DEFAULT_TYPE
      expect(subject).to have(:no).error_on(:basket_type)
    end
  end

  describe "@price" do
    it "is required" do
      subject.price = nil
      expect(subject).to have_at_least(1).error_on(:price)

      subject.price = 12.5
      expect(subject).to have(:no).error_on(:price)
    end

    it "is a positive float or integer" do
      subject.price = -1
      expect(subject).to have(1).error_on(:price)

      subject.price = 5
      expect(subject).to have(:no).error_on(:price)
    end
  end
end
