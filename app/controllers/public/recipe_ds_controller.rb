class Public::RecipeDsController < ApplicationController
  def index
  end

  def new
    @recipe_d = RecipeD.new
    # 親モデル.子モデル.buildで子モデルのインスタンス作成
    @materials = @recipe_d.materials.build
    @procedures = @recipe_d.procedures.build
  end

  def create
    @recipe_d = RecipeD.new(recipe_d_params)
    if @recipe_d.save
      redirect_to top_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def recipe_d_params
    params.require(:recipe_d).permit(:title, :explanation, :time, :people, :image,
                                    #cocoonで実装する動的なフォームで表示するテーブルの許可
                                    materials_attributes:[:material_name, :quantity, :_destroy],
                                    procedures_attributes:[:procedure_explanation, :image, :_destroy])
  end
end
