class Admin::UsersController < ApplicationController

private
  def user_params
    params.require(:user).permit(:nickname, :image, :is_active)
  end
end
