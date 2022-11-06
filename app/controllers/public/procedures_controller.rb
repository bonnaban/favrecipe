class Public::ProceduresController < ApplicationController

private
  def procedure_params
    params.require(:procedure).permit(:procedure_explanation, :image)
  end
end
