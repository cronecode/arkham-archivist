require 'rails_helper'

RSpec.describe "/campaigns/:campaign_id/investigators", type: :request do
  describe "POST#create" do
    it "creates a new investigator with a valid name" do
      campaign = FactoryGirl.create(:campaign)

      expect do
        post campaign_investigators_path(campaign), params: { investigator: { name: "Jim Culver" } }
      end.to change { Investigator.count }.by(1)

      expect(response).to redirect_to campaign_investigator_path(campaign, Investigator.last)
    end
  end
end