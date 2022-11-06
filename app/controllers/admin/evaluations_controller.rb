class Admin::EvaluationsController < ApplicationController
  
private
  def evaluation_params
    params.require(:evaluation).permit(:star, :image)
  end
end
