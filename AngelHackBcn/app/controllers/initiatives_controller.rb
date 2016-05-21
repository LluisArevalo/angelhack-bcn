class InitiativesController < ApplicationController
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

  def users_index
    @initiatives = Initiative.all
  end

  private
  def initiative_params
    params.require(:initiative).permit(:title, :content)
  end
end
