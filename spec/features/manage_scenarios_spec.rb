require 'rails_helper'

RSpec.describe "Scenario Management", type: :feature do
  describe "View a scenario" do
    it "displays the scenario's information" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "The Gathering", campaign: campaign)

      visit campaign_scenario_path(campaign, scenario)

      expect(page).to have_content(Scenario.last.name)
    end
  end

  describe "Resolve a scenario" do
    it "records the outcome of a completed scenario" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "Midnight Masks", campaign: campaign)

      visit campaign_scenario_path(campaign, scenario)
      click_link "Resolve"

      within("form") do
        fill_in "Victory display", with: 10
        select "R2", from: "Resolution"
        fill_in "Notes", with: "Something notable"
        click_button "Save"
      end

      expect(page).to have_content(10)
      expect(page).to have_content("R2")
      expect(page).to have_content("Something notable")
    end
  end

  describe "Remove a scenario" do
    it "deletes an existing scenario" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "Midnight Masks", campaign: campaign)

      visit campaign_path(campaign)
      click_link "Midnight Masks"
      click_link "Delete"

      expect(page).to_not have_link("Midnight Masks")
    end
  end
end