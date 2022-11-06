class Public::UsersController < ApplicationController

private
  def user_params
    params.require(:user).permit(:nickname, :image)
  end
end
