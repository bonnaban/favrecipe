class Material < ApplicationRecord
  has_one_attached :image
  belongs_to :recipe_d

  validates :material_name, presence: true
  validates :quantity, presence: true
end
