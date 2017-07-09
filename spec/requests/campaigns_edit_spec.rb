require 'rails_helper'

RSpec.describe "/campaigns/:id/edit", type: :request do
  describe "GET#edit" do
    it "displays the Edit Campaign view" do
      campaign = FactoryGirl.create(:campaign)

      get edit_campaign_path(campaign.id)

      expect(response).to have_http_status(:success)
    end
  end
end