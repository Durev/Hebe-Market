# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it { is_expected.to have_many(:subscriptions) }
end
