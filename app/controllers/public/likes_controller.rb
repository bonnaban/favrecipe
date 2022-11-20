class Public::LikesController < ApplicationController
  def create
    recipe_d = RecipeD.find(params[:recipe_d_id])
    like = current_user.likes.new(recipe_d_id: recipe_d.id)
    like.save
    redirect_to recipe_d_path(recipe_d)
  end

  def destroy
    recipe_d = RecipeD.find(params[:recipe_d_id])
    like = current_user.likes.find_by(recipe_d_id: recipe_d.id)
    like.destroy
    redirect_to recipe_d_path(recipe_d)
  end
end
