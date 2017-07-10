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
            id: campaign.id
          }, status: 200
        }
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:cycle, :id, :name)
    end
  end
end

