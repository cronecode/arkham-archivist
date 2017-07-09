require 'rails_helper'

RSpec.describe '/api/campaigns', type: :request do

  describe "POST#create" do
    it 'creates a new campaign' do
      expect do
        post campaigns_path, params: { campaign: { name: "Solo Campaign", cycle: "The Dunwich Legacy" } }
      end.to change { Campaign.count }.by(1)

      expect(response).to redirect_to edit_campaign_url(Campaign.last)
    end
  end
end