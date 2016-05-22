class InitiativeStatusesController < ApplicationController
  def new
    @initiative_status = Initiative_status.new
  end

  def create
    @initiative_status = Initiative_status.new initiative_params
    if @initiative_status.save
      redirect_to initiatives_path
    else
      render :new
    end
  end

  def initiative_params
    params.require(:initiative_status).permit(:user_id, :initiative_id, :solved)
  end
end
