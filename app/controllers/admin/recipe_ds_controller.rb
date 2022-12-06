class Admin::RecipeDsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @recipe_d = RecipeD.find(params[:id])
  end

  def edit
    @recipe_d = RecipeD.find(params[:id])
  end

  def update
    @recipe_d = RecipeD.find(params[:id])
    if @recipe_d.update(recipe_d_params)
      redirect_to admin_recipe_d_path(@recipe_d)
    else
      render :edit
    end
  end

  def destroy
    @recipe_d = RecipeD.find(params[:id])
    @recipe_d.destroy
    redirect_to admin_top_path
  end

private
  def recipe_d_params
    params.require(:recipe_d).permit(:user_id, :title, :explanation, :time, :people, :image, tag_ids: [],
                                    #cocoonで実装する動的なフォームで表示するテーブルの許可
                                    materials_attributes:[:id, :material_name, :quantity, :_destroy],
                                    procedures_attributes:[:id, :procedure_explanation, :image, :_destroy])
  end
end
