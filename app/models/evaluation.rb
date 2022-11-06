class Evaluation < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :recipe_d

  validates :star, presence: true
end
