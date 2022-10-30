class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :recipe_d

  validates :star, presence: true
end
