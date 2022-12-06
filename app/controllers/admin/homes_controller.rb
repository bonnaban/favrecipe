class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # tag_idがparameterに送られたら,Tagに基づいたrecipeを表示。
    # user_idがparameterに送られたら,Userに基づいたrecipeを表示。送られなければ全て表示
    if params[:tag_id].present?
      @recipe_d = Tag.find(params[:tag_id]).recipe_ds
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @recipe_d = User.find(params[:user_id]).recipe_ds
    else
      @recipe_d = RecipeD.all
    end
    # left_joinsでテーブルを結合、groupでrecipe_ds.idが同じ物をまとめる、orderで指定した条件で表示、今回はいいね数が多い順に表示
    @recipe_ds = @recipe_d.left_joins(:likes).group("recipe_ds.id").order("count(likes.recipe_d_id) desc").page(params[:page]).per(8)
  end

  private
  def home_params
    params.require(:home).permit(:image, tag_ids: [])
  end
end
