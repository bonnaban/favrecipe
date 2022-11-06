class Public::LikesController < ApplicationController

private
  def like_params
    params.require(:like).permit(:image)
  end
end
