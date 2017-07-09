require 'rails_helper'

RSpec.describe "/campaigns/:id/investigators/new", type: :request do
  describe "GET#new" do
    it "displays the New Investigator view" do
      campaign = FactoryGirl.create(:campaign)
      get new_campaign_investigator_path(campaign)

      expect(response).to have_http_status(:success)
    end
  end
end