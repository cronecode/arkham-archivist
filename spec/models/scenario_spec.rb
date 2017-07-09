require 'rails_helper'

RSpec.describe Scenario, type: :model do
  it "should be invalid if name is blank" do
    scenario = FactoryGirl.build(:scenario, name: "    ")

    valid = scenario.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid without a campaign id" do
    scenario = FactoryGirl.build(:scenario, campaign_id: nil)

    valid = scenario.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if notes are blank" do
    scenario = FactoryGirl.build(:scenario, notes: "    ")

    valid = scenario.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if victory_display is negative" do
    scenario = FactoryGirl.build(:scenario, victory_display: -1)

    valid = scenario.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if order is less than 1" do
    scenario = FactoryGirl.build(:scenario, order: 0)

    valid = scenario.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if order is not unique within the campaign" do
    campaign = FactoryGirl.create(:campaign)
    FactoryGirl.create(:scenario, campaign: campaign, order: 3)
    scenario2 = FactoryGirl.build(:scenario, campaign: campaign, order: 3)

    valid = scenario2.valid?

    expect(valid).to eq(false)
  end
end