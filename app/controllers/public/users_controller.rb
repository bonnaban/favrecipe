class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def confirmation
  end

  def like
    # user_idがparameterに送られたら、Userに基づいたrecipeを表示。送られなければ全て表示
    @recipe_d = params[:tag_id].present? ? Tag.find(params[:tag_id]).recipe_ds : RecipeD.all
    @recipe_ds = @recipe_d.page(params[:page]).per(8)
  end

  def post
    # user_idがparameterに送られたら、Userに基づいたrecipeを表示。送られなければ全て表示
    @recipe_d = params[:user_id].present? ? User.find(params[:user_id]).recipe_ds : RecipeD.all
    @recipe_ds = @recipe_d.page(params[:page]).per(8)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
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
    params.require(:user).permit(:nickname, :email, :profile_image)
  end
end
