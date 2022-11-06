class Procedure < ApplicationRecord
  has_one_attached :image
  belongs_to :recipe_d

  validates :procedure_explanation, presence: true
end
