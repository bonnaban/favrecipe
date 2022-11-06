class Admin::RecipeDsController < ApplicationController
  
private
  def recipe_d_params
    params.require(:recipe_d).permit(:title, :explanation, :time, :people, :image)
  end
end
