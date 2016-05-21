class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new action_params
    # if @action.save
    #   redirect_to :index
    # else
    #   render :new
    # end
  end

  def edit
    @action = Action.find params[:id]
  end

  private
  def action_params
    params.require(:action).permit(:title, :content)
  end
end
