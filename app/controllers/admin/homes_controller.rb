class Admin::HomesController < ApplicationController
  def top
    @recipe_d = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipe_ds : RecipeD.all
    @recipe_ds = @recipe_d.page(params[:page]).per(8)
  end

  private
  def home_params
    params.require(:home).permit(:image, tag_ids: [])
  end
end
