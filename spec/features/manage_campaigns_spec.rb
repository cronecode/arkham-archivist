require 'rails_helper'

RSpec.describe "Campaign Management", type: :feature do
  describe "Add a new campaign" do
    it "adds the cycle scenarios to the created campaign" do
      cycle = Campaign::CYCLES.values.first
      visit root_path
      click_link "Add new campaign"

      within("form") do
        select cycle, from: "Cycle"
        fill_in "Name", :with => "Night of the Zealot"
        click_button "Save"
      end
      cycle_scenarios = Scenario::CYCLE_SCENARIOS_MAPPING[cycle]

      same_number = (Campaign.last.scenarios.size == cycle_scenarios.size)
      expect(same_number).to eq(true)
    end
  end

  describe "View a campaign" do
    it "displays the campaign's information" do
      campaign = FactoryGirl.create(:campaign, name: "Dunwich Legacy", notes: "I'm a note!")

      visit campaigns_path
      click_link "Dunwich Legacy"

      expect(page).to have_content(campaign.notes)
    end

    it "displays a list of the campaign's scenarios" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, campaign: campaign, name: "The Gathering")

      visit campaign_path(campaign.id)

      expect(page).to have_link "The Gathering"
    end
  end

  describe "View all campaigns" do
    it "displays the list of created campaigns" do
      FactoryGirl.create(:campaign, name: "Dunwich Legacy")

      visit root_path
      click_link "View my campaigns"

      expect(page).to have_link("Dunwich Legacy")
    end
  end

  describe "Add/edit campaign notes" do
    it "saves notes on an existing campaign" do
      campaign = FactoryGirl.create(:campaign)
      visit edit_campaign_path(campaign)

      page.fill_in campaign[:notes], with: "Vital information"
      click_button "Save"
      visit root_path
      visit campaign_path(campaign)

      expect(page).to have_content("Vital information")
    end
  end

  describe "Remove campaign" do
    it "deletes an existing campaign" do
      campaign = FactoryGirl.create(:campaign, name: "Dunwich Legacy")

      visit campaigns_path
      click_link "Delete"

      expect(page).to_not have_content("Dunwich Legacy")
    end
  end
end

