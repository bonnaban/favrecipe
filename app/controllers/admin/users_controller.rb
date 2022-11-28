class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5)
  end

  def post
    @user = User.find(params[:user_id])
    # user_idがparameterに送られたら、Userに基づいたrecipeを表示。送られなければ全て表示
    @recipe_d = params[:user_id].present? ? User.find(params[:user_id]).recipe_ds : RecipeD.all
    @recipe_ds = @recipe_d.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_user_path(@user)
    end
  end

private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :is_active)
  end
end
