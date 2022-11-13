class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def confirmation
  end

  def like
  end

  def post
  end

  def edit
    @user = current_user
  end

  def update
  end

  def withdrawal
  end

private
  def user_params
    params.require(:user).permit(:nickname, :image)
  end
end
