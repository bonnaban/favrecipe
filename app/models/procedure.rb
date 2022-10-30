class Procedure < ApplicationRecord
  belongs_to :recipe_d

  validates :procedure_explanation, presence: true
end
