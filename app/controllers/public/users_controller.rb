class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def confirmation
  end

  def like
  end

  def post
    @recipe_d = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipe_ds : RecipeD.all
    @recipe_ds = @recipe_d.page(params[:page]).per(8)
  end

  def edit
    @user = current_user
  end

  def update
  end

  def withdrawal
    @user = current_user
    @user.update!(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:nickname, :image)
  end
end
