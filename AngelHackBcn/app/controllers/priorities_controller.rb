class PrioritiesController < ApplicationController
  

  private
  def initiative_params
    params.require(:initiative).permit(:title, :content, :topic_id, :region_id)
  end
end
