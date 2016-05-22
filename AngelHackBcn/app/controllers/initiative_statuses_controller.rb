class InitiativeStatusesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only ['create']

  def create
    initiative_status = InitiativeStatus.new permit_params
    if initiative_status.save
      render(status: 200, :nothing => true)
    else
      render(status: 500, :nothing => true)
    end
  end

  private
  def permit_params
    params.permit(:user_id, :initiative_id, :solved)
  end
end
