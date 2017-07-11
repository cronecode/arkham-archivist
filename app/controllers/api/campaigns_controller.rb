module Api
  class CampaignsController < ApiController
    def index
      campaigns = Campaign.all
      render json: campaigns
    end

    def create
      @campaign = Campaign.new(campaign_params)

      if @campaign.save
        @campaign.scenarios << cycle_scenarios
        render json: {
          data: {
            id: @campaign.id,
          }, status: 200
        }
      end
    end

    private

    def campaign_params
      params.require(:campaign).permit(:cycle, :id, :name)
    end

    def cycle_scenarios
      scenario_names = Scenario::CYCLE_SCENARIOS_MAPPING[@campaign.cycle]
      scenario_names.map { |name| Scenario.new(campaign: @campaign, name: name, order: scenario_names.find_index(name) + 1)}
    end
  end
end

