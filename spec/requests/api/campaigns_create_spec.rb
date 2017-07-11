require 'rails_helper'

RSpec.describe '/api/campaigns', type: :request do

  describe "POST#create" do
    it 'creates a new campaign' do
      expect do
        post api_campaigns_path, params: { campaign: { name: "Solo Campaign", cycle: "The Dunwich Legacy" }}
      end.to change { Campaign.count }.by(1)

      id = Campaign.last.id

      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        data: {
          id: id
        }
      )
    end

    it 'campaign scenarios are generated during creation according to campaign cycle' do
      post api_campaigns_path, params: { campaign: { name: "2-Player Campaign", cycle: "Night of the Zealot" }}

      scenarios = Campaign.last.scenarios.order(:order)
      first = "The Gathering"
      second = "Midnight Masks"
      third = "The Devourer Below"

      expect(scenarios[0].name).to eq(first)
      expect(scenarios[1].name).to eq(second)
      expect(scenarios[2].name).to eq(third)
    end
  end
end