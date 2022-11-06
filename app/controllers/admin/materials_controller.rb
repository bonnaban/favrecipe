class Admin::MaterialsController < ApplicationController
  
private
  def material_params
    params.require(:material).permit(:material_name, :quantity, :image)
  end
end
