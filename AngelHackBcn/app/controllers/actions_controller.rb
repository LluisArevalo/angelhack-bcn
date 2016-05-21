class ActionsController < ApplicationController

  def users_index
    @actions = Action.all
  end
end
