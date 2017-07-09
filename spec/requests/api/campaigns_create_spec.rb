require 'rails_helper'

RSpec.describe '/api/campaigns', type: :request do

  describe "POST#create" do
    it 'creates a new campaign' do
      expect do
        post api_campaigns_path, params: { campaign: { name: "Solo Campaign", cycle: "The Dunwich Legacy" } }
      end.to change { Campaign.count }.by(1)

      expect(response).to have_http_status(200)
    end
  end
end