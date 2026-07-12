require 'rails_helper'

RSpec.describe Shift, type: :model do
  # 1. Setup a fake user in memory to test with
  let(:test_user) { User.create(email: "rspec@test.com", password: "password123", username: "RSpecUser") }

  # 2. Test the "Happy Path" (It should work)
  it "is valid with a date, a shift_type, and a user" do
    shift = Shift.new(
      date: Date.today,
      shift_type: "Morning",
      user: test_user
    )
    expect(shift).to be_valid
  end

  # 3. Test the "Sad Path" (It should block a blank date)
  it "is invalid without a date" do
    shift = Shift.new(shift_type: "Morning", user: test_user)
    expect(shift).to_not be_valid
  end

  # 4. Test the "Sad Path" (It should block a blank shift_type)
  it "is invalid without a shift_type" do
    shift = Shift.new(date: Date.today, user: test_user)
    expect(shift).to_not be_valid
  end
end