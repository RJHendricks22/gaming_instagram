class CommentsController < ApplicationController
  
  def create
    Comment.create(
        content: params[:content],
        picture_id: params[:picture_id],
        user_id: params[:user_id])
    redirect_to (:back)
  end
  def destroy
    Comment.destroy(params[:id])
    redirect_to(:back)
  end

end
