module Api
  class CampaignsController < ApiController
    def index
      campaigns = Campaign.all

      respond_to do |format|
        format.json { render json: campaigns }
      end
    end

    def create
      Campaign.new(campaign_params)
      campaigns = Campaign.all

      respond_to do |format|
        format.json { render json: campaigns }
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:cycle, :name)
    end
  end
end

