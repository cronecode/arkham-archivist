module Api
  class InvestigatorsController < ApiController

    def create
      @campaign = Campaign.find(params[:campaign_id])
      @investigator = Investigator.new(investigator_params.merge(campaign: @campaign))
      if @investigator.save
        render json: {
          data: {
            id: @investigator.id
          }, status: 200
        }
      end
    end

    private

    def investigator_params
      params.require(:investigator).permit(
        :name, :status, :physical_trauma, :mental_trauma, :experience_earned,
        :unspent_experience
      )
    end
  end
end
