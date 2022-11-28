class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_recipe_d_path(params[:recipe_d_id])
  end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
