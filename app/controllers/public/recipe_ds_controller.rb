class Public::RecipeDsController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check, {only:[:new, :edit]}
  def index
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

  def new
    @recipe_d = RecipeD.new
    # 親モデル.子モデル.buildで子モデルのインスタンス作成
    @materials = @recipe_d.materials.build
    @procedures = @recipe_d.procedures.build
  end

  def create
    @recipe_d = RecipeD.new(recipe_d_params)
    @recipe_d.user_id = current_user.id
    if @recipe_d.save
      redirect_to recipe_d_path(@recipe_d)
    else
      render :new
    end
  end

  def show
    @recipe_d = RecipeD.find(params[:id])
    @comment = Comment.new
    #@comments = Comment.where(recipe_d_id: params[:id])
  end

  def edit
    @recipe_d = RecipeD.find(params[:id])
  end

  def update
    @recipe_d = RecipeD.find(params[:id])
    if @recipe_d.update(recipe_d_params)
      redirect_to recipe_d_path(@recipe_d)
    else
      render :edit
    end
  end

  def destroy
    @recipe_d = RecipeD.find(params[:id])
    @recipe_d.destroy
    redirect_to recipe_ds_path
  end

private
  def recipe_d_params
    params.require(:recipe_d).permit(:user_id, :title, :explanation, :time, :people, :image, tag_ids: [],
                                    #cocoonで実装する動的なフォームで表示するテーブルの許可
                                    materials_attributes:[:id, :material_name, :quantity, :_destroy],
                                    procedures_attributes:[:id, :procedure_explanation, :image, :_destroy])
  end
  # ゲストログイン時の制限
  def guest_check
    if current_user.email == 'guest@example.com'
      redirect_to root_path, notice: "このページを見るには会員登録が必要です。"
    end
  end
end
