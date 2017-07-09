require 'rails_helper'

RSpec.describe "/campaigns/:campaign_id/scenarios/:id/edit", type: :request do
  describe "GET#edit" do
    it "displays the Edit Scenario view" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id)

      get edit_campaign_scenario_path(campaign, scenario)

      expect(response).to have_http_status(:success)
    end
  end
end