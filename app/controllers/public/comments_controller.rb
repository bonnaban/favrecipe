class Public::CommentsController < ApplicationController
  def create
    @recipe_d = RecipeD.find(params[:recipe_d_id])
    @comment = current_user.comments.new(comment_params)
    @comment.recipe_d_id = @recipe_d.id
    @comment.save
    redirect_to recipe_d_path(@recipe_d)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_d_path(params[:recipe_d_id])
  end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
