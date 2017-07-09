module Api
  class CampaignsController < ApiController
    def index
      campaigns = Campaign.all
      render json: campaigns
    end

    def create
      campaign = Campaign.new(campaign_params)
      if campaign.save
        render json: {
          data: {
            name: campaign.name
          }
        }, status: 200
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:cycle, :name)
    end
  end
end

