class Public::UsersController < ApplicationController
  before_action :guest_check
  def show
    @user = current_user
  end

  def confirmation
  end

  def like
    # userモデルで定義したlike_recipe_dsでいいね一覧表示
    @recipe_ds = current_user.like_recipe_ds.page(params[:page]).per(8)
  end

  def post
    # Userに基づいたrecipeを表示。
    @recipe_ds = User.find(params[:user_id]).recipe_ds.page(params[:page]).per(8)
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
  # ゲストログイン時の制限
  def guest_check
    if current_user == User.find(2)
      redirect_to root_path, notice: "このページを見るには会員登録が必要です。"
    end
  end
end
