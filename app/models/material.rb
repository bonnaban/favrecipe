class Material < ApplicationRecord
  belongs_to :recipe_d

  validates :material_name, presence: true
  validates :quantity, presence: true
end
