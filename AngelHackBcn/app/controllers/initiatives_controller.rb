class InitiativesController < ApplicationController
  layout 'public'
  def index
    @initiatives = Initiative.all
  end

  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = Initiative.new initiative_params
    if @initiative.save
      redirect_to initiatives_path
    else
      render :new
    end
  end

  def edit
    @initiative = Initiative.find params[:id]
  end

  def update
    initiative = Initiative.find params[:id]
    initiative.update_attributes initiative_params
    initiative.region.update_attribute :area, params[:area]

    redirect_to initiatives_path
  end

  def destroy
    initiative = Initiative.find params[:id]
    initiative.destroy
    redirect_to initiatives_path
  end

  def users_index
    @initiatives = Initiative.all
  end

  private
  def initiative_params
    params.require(:initiative).permit(:title, :content, :topic_id, :region_id)
  end
end
