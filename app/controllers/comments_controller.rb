class CommentsController < ApplicationController

  def create
    @church = Church.find(params[:church_id])
    @church.comments.create(comment_params)
    redirect_to church_path(@church)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
