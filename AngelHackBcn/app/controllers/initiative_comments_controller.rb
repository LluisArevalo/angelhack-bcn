class InitiativeCommentsController < ApplicationController
  def new
    @initiative_comment = Initiative_comment.new
  end

  def create
    @initiative_comment = Initiative_status.new comment_params
    if @initiative_comment.save
      redirect_to initiatives_path
    else
      render :new
    end
  end

  def comment_params
    params.require(:initiative_comment).permit(:user_id, :initiative_id, :comment)
  end
end
