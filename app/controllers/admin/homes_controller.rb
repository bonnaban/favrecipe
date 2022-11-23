class Admin::HomesController < ApplicationController
  def top
    @recipe_ds = RecipeD.page(params[:page]).per(8)
  end
end
