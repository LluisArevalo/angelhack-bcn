class PrioritiesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only ['create']

  def create
    priority_assignation = PriorityAssignation.new(
                            initiative_id: params[:initiative_id],
                            priority_id: params[:priority_id],
                            user_id: params[:user_id]
                          )
    if priority_assignation.save
      render(status: 200, :nothing => true)
    else
      render(status: 500, :nothing => true)
    end
  end
end
