require 'rails_helper'

RSpec.describe "Investigator Management", type: :feature do
  describe "Add a new investigator" do
    it "creates a investigator" do
      campaign = FactoryGirl.create(:campaign)
      investigator = Investigator::POSSIBLE_INVESTIGATORS.values.first
      visit campaign_path(campaign)
      click_link "Add Investigator"

      within("form") do
        select investigator, from: "Name"
        click_button "Save"
      end

      expect(page).to have_content(investigator)
    end
  end

  describe "View investigator stats" do
    it "displays an investigator's information" do
      campaign = FactoryGirl.create(:campaign)
      FactoryGirl.create(:investigator,
                         name:               "Skids O'Toole",
                         campaign_id:        campaign.id,
                         status:             Investigator::INSANE,
                         physical_trauma:    2,
                         mental_trauma:      6,
                         experience_earned:  10,
                         unspent_experience: 5)

      visit campaign_path(campaign)

      expect(page).to have_text("Status: INSANE")
      expect(page).to have_text("Physical Trauma: 2")
      expect(page).to have_text("Mental Trauma: 6")
      expect(page).to have_text("Experience Earned: 10")
      expect(page).to have_text("Unspent XP: 5")
    end
  end

  describe "Update investigator stats" do
    it "edits an investigator's information" do
      campaign = FactoryGirl.create(:campaign)
      investigator = FactoryGirl.create(:investigator, name: "Pete", campaign: campaign)

      visit campaign_investigator_path(campaign, investigator)
      click_link "Update"
      within "form" do
        select Investigator::KILLED, from: "Status"
        fill_in "Physical Trauma", with: 2
        fill_in "Mental Trauma", with: 6
        fill_in "Experience Earned", with: 10
        fill_in "Unspent Experience", with: 5
        click_button "Save"
      end
      visit campaign_investigator_path(campaign, investigator)

      expect(page).to have_text("Status: KILLED")
      expect(page).to have_text("Physical Trauma: 2")
      expect(page).to have_text("Mental Trauma: 6")
      expect(page).to have_text("Experience Earned: 10")
      expect(page).to have_text("Unspent Experience: 5")
    end
  end

  describe "Remove an investigator" do
    it "deletes an existing investigator" do
      campaign = FactoryGirl.create(:campaign)
      investigator = FactoryGirl.create(:investigator, name: "Daisy Walker", campaign: campaign)

      visit campaign_path(campaign)
      click_link "Delete"

      expect(page).to_not have_content("Daisy Walker.png")
    end
  end
end
