require 'rails_helper'

RSpec.describe Investigator, type: :model do
  it "should be invalid if name is empty" do
    investigator = FactoryGirl.build(:investigator, name: "    ")

    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if name is not unique" do
    FactoryGirl.create(:investigator, name: "Rex")
    investigator = FactoryGirl.build(:investigator, name: "Rex")

    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be active by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    status = investigator.status

    expect(status).to eq(Investigator::ACTIVE)
  end

  it "should be invalid with negative physical trauma" do
    investigator = FactoryGirl.build(:investigator, physical_trauma: -1)

    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid with negative mental trauma" do
    investigator = FactoryGirl.build(:investigator, mental_trauma: -1)

    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid with negative earned experience" do
    investigator = FactoryGirl.build(:investigator, experience_earned: -1)

    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid with negative unspent experience" do
    investigator = FactoryGirl.build(:investigator, unspent_experience: -1)

    valid = investigator.valid?

    expect(valid).to eq(false)
  end
end
