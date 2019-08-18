# frozen_string_literal: true

RSpec.describe Basket, type: :model do
  it "has a valid factory"

  describe "basket_type" do
    it "is required"
    it "is a valid type"
  end

  describe "price" do
    it "is required"
    it "is a positive float"
  end
end
