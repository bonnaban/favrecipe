class RecipeD < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :material, dependent: :destroy
  has_many :procedure, dependent: :destroy
  has_many :evaluation, dependent: :destroy
  
  validates :title, presence: true
  validates :explanation, presence: true
end
