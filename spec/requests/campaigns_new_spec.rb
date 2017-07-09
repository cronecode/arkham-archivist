require 'rails_helper'

RSpec.describe "/campaigns/new", type: :request do
  describe "GET#new" do
    it "displays the New Campaign view" do
      get new_campaign_path

      expect(response).to have_http_status(:success)
    end
  end
end