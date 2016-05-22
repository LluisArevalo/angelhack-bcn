class PrioritiesController < ApplicationController
  def create
    priority_assignation = PriorityAssignation.new(
                            initiative_id: params[:initiative_id],
                            priority_id: params[:priority_id],
                            user_id: current_user.id
                          )
    if priority_assignation.save
      priority = PriorityAssignation.set_priority params[:initiative_id]
      initiative = Initiative.find params[:initiative_id]
      initiative.update_attribute(priority_id: priority)
    end
  end
end
