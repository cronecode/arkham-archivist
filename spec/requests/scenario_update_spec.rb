require 'rails_helper'

RSpec.describe "/campaigns/:campaign_id/scenarios/:id", type: :request do
  describe "PUT#update" do
    it "updates the scenario's info" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "Foo", resolution: "R3", campaign_id: campaign.id)
      params = { scenario: { resolution: "R3" } }

      put campaign_scenario_path(campaign, scenario), params: params

      expect(scenario.resolution).to eq("R3")
    end
  end
end