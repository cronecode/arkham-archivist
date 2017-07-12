require 'rails_helper'

RSpec.describe "/api/campaigns/:campaign_id/investigators", type: :request do
  describe "POST#create" do
    it "creates a new investigator" do
      campaign = FactoryGirl.create(:campaign)

      expect do
        post api_campaign_investigators_path(campaign), params: {
          campaign: {
            id: campaign.id
          },
          investigator: {
            name: "Jim Culver"
          }
        }
      end.to change { Investigator.count }.by(1)

      id = Investigator.last.id

      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        data: {
          id: id
        }
      )
    end
  end
end